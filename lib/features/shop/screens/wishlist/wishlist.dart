import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/product/favourites_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
    final favouriteController = FavouritesController.instance;
    return Scaffold(
      // App bar
      appBar: TAppBar(
        title: Text('Danh mục yêu thích',
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          TCircularIcon(
              icon: Iconsax.add,
              onPressed: () => navigationController.selectedIndex.value = 0)
        ],
      ),
      // Bpdy
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          //
          child: Obx(
            () => FutureBuilder(
                future: favouriteController.favouriteProducts(),
                builder: (context, snapshot) {
                  //nothing found widget
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Danh mục yêu thích đang trống...',
                    animation: TImages.emptyBox,
                    showAction: true,
                    actionText: 'Thêm sản phẩm',
                    onActionPressed: () =>
                        navigationController.selectedIndex.value = 0,
                  );
                  const loader = TVerticalProductShimmer(itemCount: 6);
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: loader,
                    nothingFound: emptyWidget,
                  );
                  if (widget != null) return widget;
                  final products = snapshot.data!;
                  return TGridLayout(
                    itemCount: products.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: products[index],
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
