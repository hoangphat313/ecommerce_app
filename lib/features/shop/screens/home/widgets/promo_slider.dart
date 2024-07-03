import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:e_commerce/common/widgets/images/t_rounded_images.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/features/shop/controllers/banner_controller.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        //loader
        if (controller.isLoading.value) {
          return const TShimmerEffect(width: double.infinity, height: 190);
        }
        //no data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('Không có dữ liệu'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                  ),
                  items: controller.banners
                      .map((banner) => TRoundedImage(
                            imageUrl: banner.imageUrl,
                            isNetworkImage: true,
                            onPressed: () => Get.toNamed(banner.targetScreen),
                          ))
                      .toList()),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey,
                        ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
