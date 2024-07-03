import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/upload/upload_banner_screen.dart';
import 'package:e_commerce/features/personalization/screens/upload/upload_product_screen.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UploadGeneralScreen extends StatelessWidget {
  const UploadGeneralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text("Upload Menu"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //upload product
              TSettingMenuTile(
                title: 'Upload Product',
                subtitle: 'Upload my Product',
                icon: Iconsax.box_add,
                onTap: () => Get.to(() => const UploadDummyDataScreen()),
              ),
              // upload banner
              TSettingMenuTile(
                title: 'Upload Banner',
                subtitle: 'Upload my Banner',
                icon: Iconsax.add_circle,
                onTap: () => Get.to(() => const UploadBannerScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
