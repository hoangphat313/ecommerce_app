import 'package:e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BannerController extends GetxController {
  //variables
  final isLoading = false.obs;

  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final BannerRepository _repository = Get.put(BannerRepository());
  //
  Rx<XFile?> selectedImage = Rx<XFile?>(null);
  RxBool isActive = false.obs;
  TextEditingController targetScreenController = TextEditingController();

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //update page indicator
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //fetch banner
  Future<void> fetchBanners() async {
    try {
      //show loader
      isLoading.value = true;
      //fetch banner
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();
      //assign banner
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove loader
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    selectedImage.value = image;
  }

  //upload banner
  Future<void> uploadBanner() async {
    if (selectedImage.value != null) {
      final banner = BannerModel(
        imageUrl: selectedImage.value!.path,
        targetScreen: targetScreenController.text,
        active: isActive.value,
      );
      await _repository.uploadBanner(banner);
    }
  }
}
