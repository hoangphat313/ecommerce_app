import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/screens/product_details/product_detail.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final controller = Get.put(ProductController());
  List<ProductModel> _searchResults = [];
  bool _isLoading = false;
  bool _noResults = false;

  void _searchProducts(String query) async {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
        _noResults = false;
      });
      return;
    }
    setState(() {
      _isLoading = true;
      _noResults = false;
    });

    final result =
        await FirebaseFirestore.instance.collection('Products').get();

    setState(() {
      _searchResults = result.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
      _isLoading = false;
      _noResults = _searchResults.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Tìm kiếm sản phẩm'),
        showBackArrow: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Tìm kiếm sản phẩm theo tên',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchProducts(_searchController.text),
                ),
              ),
              onSubmitted: (value) => _searchProducts(value),
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _noResults
                    ? Center(
                        child: Text(
                          'Không tìm thấy sản phẩm nào',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : _searchResults.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(TSizes.defaultSpace),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const TSectionHeading(
                                    title: 'Có thể bạn thích',
                                    showActionButton: false,
                                  ),
                                  const SizedBox(height: TSizes.spaceBtwItems),
                                  Obx(() {
                                    if (controller.isLoading.value) {
                                      return const TVerticalProductShimmer();
                                    }
                                    if (controller.featuredProducts.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'Không có dữ liệu',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      );
                                    }
                                    return TGridLayout(
                                      itemCount:
                                          controller.featuredProducts.length,
                                      itemBuilder: (_, index) =>
                                          TProductCardVertical(
                                        product:
                                            controller.featuredProducts[index],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _searchResults.length,
                            itemBuilder: (context, index) {
                              final product = _searchResults[index];
                              return ListTile(
                                title: Text(product.title),
                                subtitle: Text(
                                    TFormatter.formatCurrency(product.price)),
                                leading: CachedNetworkImage(
                                  imageUrl: product.thumbnail,
                                  height: 40,
                                  width: 40,
                                ),
                                trailing: TFavoriteIcon(productId: product.id),
                                onTap: () => Get.to(() =>
                                    ProductDetailScreen(product: product)),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }
}
