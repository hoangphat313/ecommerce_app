import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/enums.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  final isLoading = false.obs;
  var errorMessage = ''.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;
      //fetch product
      final products = await productRepository.getFeaturedProducts();
      //assign product
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap.', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      //fetch product
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap.', message: e.toString());
      return [];
    }
  }

  // get product price
// Định dạng tiền Việt Nam
  final NumberFormat currencyFormatter =
      NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;
    if (product.productType == ProductType.single.toString()) {
      double price = product.salePrice > 0 ? product.salePrice : product.price;
      return currencyFormatter.format(price);
    } else {
      if (product.productVariations != null) {
        for (var variation in product.productVariations!) {
          double priceToConsider =
              variation.salePrice > 0.0 ? variation.salePrice : variation.price;
          if (priceToConsider < smallestPrice) {
            smallestPrice = priceToConsider;
          }
          if (priceToConsider > largestPrice) {
            largestPrice = priceToConsider;
          }
        }
      }
      if (smallestPrice == largestPrice) {
        return currencyFormatter.format(largestPrice);
      } else {
        return '${currencyFormatter.format(smallestPrice)} - ${currencyFormatter.format(largestPrice)}';
      }
    }
  }

  //calculate discount
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  //check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  //upload dummy data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    isLoading(true);
    errorMessage('');
    try {
      await productRepository.uploadDummyData(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap.', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
