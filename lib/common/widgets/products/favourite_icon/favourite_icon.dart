import 'package:e_commerce/common/widgets/icons/t_circular_icon.dart';
import 'package:e_commerce/features/shop/controllers/product/favourites_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavourites(productId)
              ? Iconsax.heart5
              : Iconsax.heart,
          color: controller.isFavourites(productId) ? TColors.error : null,
          onPressed: () => controller.toggleFavouriteProducts(productId),
        ));
  }
}
