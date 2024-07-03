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
      id: '2',
      title: 'Quần Ngắn Thể Thao Nam Nike Court Dri-Fit Advantage 7In - Đen',
      stock: 46,
      price: 700000,
      thumbnail: TImages.shortNam,
      isFeatured: true,
      description:
          """Giữ vững phong độ trong mọi cuộc chơi cùng Quần Ngắn Thể Thao Nam Nike Court Dri-Fit Advantage 7In. Thiết kế co giãn và thông thoáng tối ưu mang đến cảm giác mát mẻ và thoải mái ngay cả khi bạn đang hăng say thi đấu hay tập luyện gian nan. Chiếc quần trang bị thêm túi tiện lợi, có thể đựng đồ cá nhân cũng như những quả bóng tennis, cho cuộc chơi trọn vẹn chẳng ngại gián đoạn. """,
      brand: BrandModel(
        id: '1',
        name: 'Nike',
        image: TImages.nikeLogo,
        productsCount: 46,
        isFeatured: true,
      ),
      images: [TImages.shortNam1, TImages.shortNam2, TImages.shortNam3],
      salePrice: 680000,
      sku: 'ABR425734',
      categoryId: '7',
      productType: 'ProductType.single',
    ),
//product 3
//     ProductModel(
//       id: '3',
//       title: 'Áo Polo Nam Nike Sportwear - Xám',
//       stock: 46,
//       price: 700000,
//       thumbnail: TImages.poloThumbnail,
//       isFeatured: true,
//       description:
//           """Áo Polo Nam Nike không chỉ đơn thuần là một chiếc áo, mà là một biểu tượng của phong cách và sự thoải mái. Chất liệu bông mềm mại tạo cảm giác thoải mái và êm ái, đồng thời giữ cho bạn luôn tự tin trong mọi hoàn cảnh.""",
//       brand: BrandModel(
//         id: '1',
//         name: 'Nike',
//         image: TImages.nikeLogo,
//         productsCount: 46,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.polo1,
//         TImages.polo2,
//       ],
//       salePrice: 680000,
//       sku: 'ABR425734',
//       categoryId: '8',
//       productType: 'ProductType.single',
//     ),
//     //product 4
//     ProductModel(
//       id: '4',
//       title: 'Áo Thun Nam Nike Sportwear - Đen',
//       stock: 26,
//       price: 350000,
//       thumbnail: TImages.aoThun,
//       isFeatured: true,
//       description:
//           """Kỷ niệm Air Max day, Nike mang đến chiếc Áo Thun Nam Nike Sportwear đậm chất cổ điển này. Với chất liệu cotton nhẹ, mềm mại mang lại cảm giác thoải mái trọn ngày dài. Thiết kế vừa vặn, phù hợp cho các hoạt động luyện tập và thể thao hằng ngày.""",
//       brand: BrandModel(
//         id: '1',
//         name: 'Nike',
//         image: TImages.nikeLogo,
//         productsCount: 34,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.aoThun1,
//         TImages.aoThun2,
//       ],
//       salePrice: 280000,
//       sku: 'ABR42556734',
//       categoryId: '9',
//       productType: 'ProductType.single',
//     ),
//     //product 5
//     ProductModel(
//       id: '5',
//       title: 'Giày Sneaker Nam Nike Air Max 1 - Trắng',
//       stock: 216,
//       price: 3500000,
//       thumbnail: TImages.giay,
//       isFeatured: true,
//       description:
//           """Nike Air Max 1 - cái tên tiên phong trong dòng giày Air Max huyền thoại, giờ đây có mặt để nâng tầm phong cách của bạn. Được ra mắt lần đầu tiên vào năm 1987, Air Max 1 không chỉ là một đôi giày thể thao, mà còn là biểu tượng của sự thoải mái và thời trang đường phố.
// Với thiết kế lấy cảm hứng từ đường phố, phần thân giày được làm từ chất liệu cao cấp, kết hợp các lớp phủ tổng hợp và lưới thoáng khí, tạo sự ôm vừa vặn, thoải mái cho bàn chân. Điểm nhấn nổi bật là bộ đệm khí Air Max nhìn thấy được ở gót giày, mang đến khả năng giảm chấn tuyệt vời, giúp đôi chân bạn luôn cảm thấy thoải mái suốt cả ngày dài.""",
//       brand: BrandModel(
//         id: '1',
//         name: 'Nike',
//         image: TImages.nikeLogo,
//         productsCount: 314,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.giay1,
//         TImages.giay2,
//       ],
//       salePrice: 2800000,
//       sku: 'ABR556734',
//       categoryId: '10',
//       productType: 'ProductType.single',
//     ),
    //product 6
//     ProductModel(
//       id: '6',
//       title:
//           """Giày Thể Thao Nam MWC 5704 - Giày Thể Thao Nam Cổ Thấp, Giày Dáng Sneaker Năng Động, Trẻ Trung, Thời Trang.
// """,
//       stock: 216,
//       price: 350000,
//       thumbnail: TImages.giayTtMvc,
//       isFeatured: true,
//       description:
//           """Giày được thiết kế dáng sneaker buộc dây năng động, mặt giày in nhiệt chữ HI cùng sắc màu trẻ trung, giày được sử dụng chất liệu da tổng hợp phối vải lưới thể thao cao cấp nên rất êm mềm, có độ co giản và bền bỉ cao.

// Giày đế cao su dẻo êm mềm, xẻ rãnh chống trơn trượt dễ đi, dễ phối hợp nhiều phong cách style khác nhau tạo nên vẻ đẹp nam tính mạnh mẽ, năng động và trẻ trung cho phái nam.

// Giày thoáng khí cả mặt trong lẫn mặt ngoài khiến người mang luôn cảm thấy dễ chịu, tự tin khi mang đi ra ngoài, dạo phố hay các hoạt động dã ngoại ngoài trời cùng bạn bè,... trong suốt thời gian dài.""",
//       brand: BrandModel(
//         id: '3',
//         name: 'MVC',
//         image: TImages.mvcLogo,
//         productsCount: 324,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.giayTtMvc1,
//         TImages.giayTtMvc2,
//       ],
//       salePrice: 280000,
//       sku: 'ABR556734',
//       categoryId: '10',
//       productType: 'ProductType.single',
//     ),
//     //product 7
//     ProductModel(
//       id: '7',
//       title:
//           """Giày sandal nam MWC NASD- 7080 Sandal Nam Quai Ngang Phối Lót Dán Thời Trang Kiểu Dáng Streetwear Đế Mềm Mại
// """,
//       stock: 26,
//       price: 250000,
//       thumbnail: TImages.sandalMVC,
//       isFeatured: true,
//       description:
//           """Được thiết kế quai ngang chéo thoáng khí, có khóa lót dán dễ dàng tùy chỉnh, giày được làm bằng chất liệu vải dù cao cấp, êm nhẹ,  bền bỉ.

// Với thiết kế dành riêng cho nam giới với kiểu dáng đơn giản pha chút hiện đại, tạo cho người mang cảm giác thoải mái, nhẹ nhàng nhưng vẫn rất thời trang.

// Sandal sử dụng các gam màu thanh lịch, đế cao su êm mềm,nhẹ thích hợp phối với nhiều trang phục khác nhau như sơ vin, jeans, sooc,..đều rất hợp và thời trang tạo thêm vẻ đẹp thanh lịch, năng động và rất nam tính cho các chàng.""",
//       brand: BrandModel(
//         id: '3',
//         name: 'MVC',
//         image: TImages.mvcLogo,
//         productsCount: 24,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.sandalMVC1,
//       ],
//       salePrice: 200000,
//       sku: 'ABR55645734',
//       categoryId: '11',
//       productType: 'ProductType.single',
//     ),
//     //product 8
//     ProductModel(
//       id: '8',
//       title: """Vớ nam nữ MWC - AT60""",
//       stock: 26,
//       price: 25000,
//       thumbnail: TImages.voMVC,
//       isFeatured: true,
//       description: """""",
//       brand: BrandModel(
//         id: '3',
//         name: 'MVC',
//         image: TImages.mvcLogo,
//         productsCount: 24,
//         isFeatured: true,
//       ),
//       images: [
//         TImages.voMVC,
//         TImages.voMVC,
//         TImages.voMVC,
//       ],
//       salePrice: 20000,
//       sku: 'ABR55645ew734',
//       categoryId: '15',
//       productType: 'ProductType.single',
//     ),
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
