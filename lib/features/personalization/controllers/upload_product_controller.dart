import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/cloud_storage/firebase_storage_service.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductController extends GetxController {
  static UploadProductController get instance => Get.find();

  final idController = TextEditingController();
  final stockController = TextEditingController();
  final skuController = TextEditingController();
  final priceController = TextEditingController();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final salePriceController = TextEditingController();
  final thumbnailController = TextEditingController();
  final isFeaturedController = TextEditingController();
  final brandIdController = TextEditingController();
  final brandNameController = TextEditingController();
  final brandImageController = TextEditingController();
  final brandProductsCountController = TextEditingController();
  final brandIsFeaturedController = TextEditingController();
  final descriptionController = TextEditingController();
  final categoryIdController = TextEditingController();
  final imagesController = TextEditingController();
  final productTypeController = TextEditingController();
  final productAttributesController = TextEditingController();
  final productVariationsController = TextEditingController();

  GlobalKey<FormState> uploadProductFormKey = GlobalKey<FormState>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final List<ProductVariationModel> productVariations = [];
  // Phương thức để thêm biến thể sản phẩm
  void addProductVariation(ProductVariationModel variation) {
    productVariations.add(variation);
  }

  //
  Future<void> pickImage({required TextEditingController controller}) async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxHeight: 512,
      maxWidth: 512,
    );
    if (image != null) {
      controller.text = image.path;
    }
  }

  //
  Future<void> uploadProduct() async {
    try {
      //loading
      TFullScreenLoader.openLoadingDialog(
          'Đang upload sản phẩm...', TImages.docerAnimation);
      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //form validation
      if (!uploadProductFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //
      final product = ProductModel(
        id: idController.text,
        title: titleController.text,
        stock: int.parse(stockController.text),
        price: double.parse(priceController.text),
        thumbnail: thumbnailController.text,
        description: descriptionController.text,
        categoryId: categoryIdController.text,
        productType: productTypeController.text,
        salePrice: double.parse(salePriceController.text),
        sku: skuController.text,
        date: dateController.text.isNotEmpty
            ? DateTime.parse(dateController.text)
            : null,
        isFeatured: isFeaturedController.text.toLowerCase() == 'true',
        brand: BrandModel(
          id: brandIdController.text,
          name: brandNameController.text,
          image: brandImageController.text,
          productsCount: int.parse(brandProductsCountController.text),
          isFeatured: brandIsFeaturedController.text.toLowerCase() == 'true',
        ),
        images: imagesController.text.isNotEmpty
            ? imagesController.text.split(',')
            : [],
        productAttributes: productAttributesController.text.isNotEmpty
            ? (productAttributesController.text.split(';').map((attr) {
                var parts = attr.split(':');
                return ProductAttributeModel(
                    name: parts[0], values: parts[1].split(','));
              }).toList())
            : [],
        productVariations: productVariationsController.text.isNotEmpty
            ? (productVariationsController.text.split(';').map((varStr) {
                var parts = varStr.split(':');
                var attrs = Map<String, String>.fromEntries(
                  parts[1].split(',').map((attr) {
                    var kv = attr.split('=');
                    return MapEntry(kv[0], kv[1]);
                  }),
                );
                return ProductVariationModel(
                  id: parts[0],
                  stock: int.parse(attrs['stock']!),
                  price: double.parse(attrs['price']!),
                  salePrice: double.parse(attrs['salePrice']!),
                  image: attrs['image']!,
                  description: attrs['description']!,
                  attributeValues: attrs,
                );
              }).toList())
            : [],
      );

      final storage = Get.put(TFirebaseStorageService());
      final thumbnailData =
          await storage.getImageDataFromAssets(product.thumbnail);
      final url = await storage.uploadImageData(
          'Products/Images', thumbnailData, product.thumbnail.toString());
      product.thumbnail = url;

      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];
        for (var image in product.images!) {
          final assetImage = await storage.getImageDataFromAssets(image);
          final url = await storage.uploadImageData(
              'Products/Images', assetImage, image);
          imagesUrl.add(url);
        }
        product.images!.clear();
        product.images!.addAll(imagesUrl);
      }

      if (product.productType == ProductType.variable.toString()) {
        for (var variation in product.productVariations!) {
          final assetImages =
              await storage.getImageDataFromAssets(variation.image);
          final url = await storage.uploadImageData(
              'Products/Images', assetImages, variation.image);
          variation.image = url;
        }
      }

      await _db.collection("Products").doc(product.id).set(product.toJson());

      // Stop loading
      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
          title: 'Success', message: 'Product data uploaded successfully!');
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
