import 'package:e_commerce/features/shop/models/banner_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/product_attribute_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/features/shop/models/product_variation_model.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';

class TDummyData {
  //banner
  // static final List<BannerModel> banners = [
  //   BannerModel(
  //       imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  //   BannerModel(
  //       imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner3,
  //       targetScreen: TRoutes.favourites,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner5,
  //       targetScreen: TRoutes.settings,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner6,
  //       targetScreen: TRoutes.userAddress,
  //       active: true),
  //   BannerModel(
  //       imageUrl: TImages.banner8,
  //       targetScreen: TRoutes.checkout,
  //       active: false),
  // ];
  //list of all product
  static final List<ProductModel> products = [
    ProductModel(
      id: '17',
      title: 'ÁO PHÔNG DÁNG BOXY FIT',
      stock: 46,
      price: 250000,
      thumbnail: TImages.teeZara,
      isFeatured: true,
      description: """Áo phông dáng boxy fit. Cổ tròn, cộc tay. Kiểu bạc màu.

Sản phẩm này có vẻ ngoài độc đáo nhờ vào quá trình giặt đặc biệt. Do đó, màu sắc thực tế của sản phẩm có thể có khác biệt nhỏ so với hình ảnh. """,
      brand: BrandModel(
        id: '5',
        name: 'Zara',
        image: TImages.zaraLogo,
        productsCount: 46,
        isFeatured: true,
      ),
      images: [
        TImages.teeZara_1,
        TImages.teeZara_2,
      ],
      salePrice: 235000,
      sku: 'ABR4257334',
      categoryId: '12',
      productType: 'ProductType.single',
    ),
    //
    ProductModel(
      id: '18',
      title: 'THẮT LƯNG DA KIỂU CỔ ĐIỂN',
      stock: 46,
      price: 180000,
      thumbnail: TImages.thatLungZara,
      isFeatured: true,
      description:
          """Thắt lưng da. Có đai luồn dây bằng da và khóa cài bằng kim loại.

Chiều rộng: 3,5 cm. """,
      brand: BrandModel(
        id: '5',
        name: 'Zara',
        image: TImages.zaraLogo,
        productsCount: 46,
        isFeatured: true,
      ),
      images: [
        TImages.thatLungZara_1,
        TImages.thatLungZara_2,
      ],
      salePrice: 135000,
      sku: 'ABR4257334',
      categoryId: '14',
      productType: 'ProductType.single',
    ),
  ];

  //list all categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sport', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '5',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
        id: '3', name: 'Cloths', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '14',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),
    //sub categories
    CategoryModel(
        id: '8',
        name: 'Sport Shoes',
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '9',
        name: 'Track Suit',
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sport Equipments',
        parentId: '1',
        image: TImages.sportIcon,
        isFeatured: false),
    //furniture
    CategoryModel(
        id: '11',
        name: 'Laptop',
        image: TImages.furnitureIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Kitchen Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Office Furniture',
        image: TImages.furnitureIcon,
        parentId: '5',
        isFeatured: false),
    //electronics
    CategoryModel(
        id: '14',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        parentId: '2',
        isFeatured: false),
    //
    CategoryModel(
        id: '16',
        name: 'Shirts',
        image: TImages.clothIcon,
        parentId: '3',
        isFeatured: false),
  ];
}
