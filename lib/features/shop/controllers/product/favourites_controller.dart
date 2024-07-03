import 'dart:convert';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/local_storage/storage_utility.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();
  // variables
  final favourites = <String, bool>{}.obs;
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  void initFavourites() {
    final json = TLocalStorage.instance().readData('favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourites(String productId) {
    return favourites[productId] ?? false;
  }

  void toggleFavouriteProducts(String productId) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      TLoaders.customToast(
          message: 'Sản phẩm đã được thêm vào danh sách yêu thích');
    } else {
      TLocalStorage.instance().removeData(productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      TLoaders.customToast(
          message: 'Sản phẩm đã được xóa khỏi danh sách yêu thích');
    }
  }

  void saveFavouritesToStorage() {
    final endcodedFavourites = json.encode(favourites);
    TLocalStorage.instance().saveData('favourites', endcodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    final productIds = favourites.keys.toList();
    if (productIds.isEmpty) {
      return [];
    }
    return await ProductRepository.instance.getFavouriteProducts(productIds);
  }
}
