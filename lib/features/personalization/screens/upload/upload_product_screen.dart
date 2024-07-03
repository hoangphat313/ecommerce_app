import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/controllers/dummy_data.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UploadDummyDataScreen extends StatelessWidget {
  const UploadDummyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final products = TDummyData.products;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Product'),
        showBackArrow: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.errorMessage.isNotEmpty) {
            return Center(child: Text('Error: ${controller.errorMessage}'));
          }
          return Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                //change
                Lottie.asset(
                  TImages.emptyBox,
                  width: THelperFunctions.screenWidth() * 0.8,
                  height: THelperFunctions.screenWidth() * 1.2,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                Center(
                  child: OutlinedButton(
                    onPressed: () async {
                      try {
                        await controller.uploadDummyData(products);
                        TLoaders.successSnackBar(
                            title: 'Chúc mừng',
                            message: 'Dummy data uploaded successfully!');
                      } catch (e) {
                        TLoaders.errorSnackBar(
                            title: 'Failed to upload dummy data',
                            message: e.toString());
                      }
                    },
                    child: const Text(
                      'Upload Data',
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
