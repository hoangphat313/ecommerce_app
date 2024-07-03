import 'dart:io';
import 'package:e_commerce/features/shop/controllers/banner_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/utils/popups/loaders.dart';

class UploadBannerScreen extends StatelessWidget {
  const UploadBannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerController = Get.put(BannerController());

    return Scaffold(
      appBar: const TAppBar(
        title: Text('Upload Banner'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: bannerController.targetScreenController,
              decoration: const InputDecoration(labelText: 'Target Screen'),
            ),
            Obx(() => SwitchListTile(
                  title: const Text('Active'),
                  value: bannerController.isActive.value,
                  onChanged: (value) {
                    bannerController.isActive.value = value;
                  },
                )),
            ElevatedButton(
              onPressed: () async {
                await bannerController.pickImage();
              },
              child: const Text('Select Image'),
            ),
            const SizedBox(height: 20),
            // Hiển thị hình ảnh đã chọn nếu có
            Obx(() => bannerController.selectedImage.value != null
                ? Image.file(
                    File(bannerController.selectedImage.value!.path),
                    height: 200,
                  )
                : Container()),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await bannerController.uploadBanner();
                TLoaders.successSnackBar(
                    title: 'Chúc mừng',
                    message: 'Banner uploaded successfully!');
              },
              child: const Text('Upload Banner'),
            ),
          ],
        ),
      ),
    );
  }
}
