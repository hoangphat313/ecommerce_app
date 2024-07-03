import 'package:e_commerce/common/widgets/brands/t_brand_card.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/brand_shimmer.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/brand_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:e_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:e_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final controller = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //app bar
                  THomeAppBar(),
                  // const SizedBox(height: TSizes.spaceBtwSections),
                  //categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        // Heading
                        TSectionHeading(
                          title: 'Danh mục phổ biến',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),
                        // Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // Promo Slider
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Heading
                  // Featured brands
                  TSectionHeading(
                    title: 'Thương hiệu nổi bật',
                    onPressed: () => Get.to(() => const AllBrandsScreen()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  // Brands GRID
                  Obx(() {
                    if (brandController.isLoading.value) {
                      return const TBrandsShimmer();
                    }
                    if (brandController.featuredBrands.isEmpty) {
                      return Center(
                          child: Text('Không có dữ liệu!',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(color: Colors.white)));
                    }
                    return TGridLayout(
                      itemCount: brandController.featuredBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.featuredBrands[index];
                        // BrandCard
                        return TBrandCard(
                          showBorder: true,
                          brand: brand,
                          onTap: () =>
                              Get.to(() => BrandProducts(brand: brand)),
                        );
                      },
                    );
                  }),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // popular product
                  TSectionHeading(
                    title: 'Sản phẩm nổi bật',
                    onPressed: () => Get.to(
                      () => AllProducts(
                        title: 'Sản phẩm nổi bật',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Popular Product
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const TVerticalProductShimmer();
                    }
                    if (controller.featuredProducts.isEmpty) {
                      return Center(
                          child: Text('Không có dữ liệu',
                              style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                              product: controller.featuredProducts[index],
                            ));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
