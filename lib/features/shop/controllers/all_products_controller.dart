import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final repository = ProductRepository.instance;
  final RxString selectedSortOption = 'Name'.obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;
  Future<List<ProductModel>> fetchProductByQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //sort product
  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case 'Tên':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case 'Giá cao hơn':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'Giá thấp hơn':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'Khuyến mãi':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (a.salePrice > 0) {
            return -1;
          } else {
            return 1;
          }
        });
        break;
      case 'Mới nhất':
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      default:
        //default: "Name"
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    this.products.assignAll(products);
    sortProducts('Tên');
  }
}
