import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:e_commerce/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:e_commerce/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce/features/personalization/controllers/theme_controller.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/address/address.dart';
import 'package:e_commerce/features/personalization/screens/policy/policy_screen.dart';

import 'package:e_commerce/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce/features/personalization/screens/upload/upload_general_screen.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final ThemeController themeController = Get.put(ThemeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Header
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                //App bar
                TAppBar(
                  title: Text(
                    'Tài khoản',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.white),
                  ),
                ),
                // Profile user card
                TUserProfileTile(
                    onPressed: () => Get.to(const ProfileScreen())),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),
            // Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Account Setting
                  const TSectionHeading(
                      title: 'Cài đặt tài khoản', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //
                  TSettingMenuTile(
                    icon: Iconsax.truck,
                    title: 'Địa chỉ',
                    subtitle: 'Thêm địa chỉ giao hàng',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Giỏ hàng',
                    subtitle: 'Thêm và xóa sản phẩm khỏi giỏ hàng',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Đơn đặt hàng',
                    subtitle: 'Xem thông tin đơn đặt hàng',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),

                  const TSettingMenuTile(
                      icon: Iconsax.discount_shape,
                      title: 'Mã giảm giá',
                      subtitle: 'Xem danh sách mã giảm giá'),
                  TSettingMenuTile(
                    icon: Iconsax.personalcard,
                    title: 'Xóa tài khoản',
                    subtitle: 'Xóa vĩnh viễn tài khoản',
                    onTap: () =>
                        userController.deleteAccountWarningPopup(context),
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections / 2),
                  // App setting
                  const TSectionHeading(
                      title: 'Cài đặt ứng dụng', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Nền tối',
                      subtitle: 'Chỉnh màu nền của ứng dụng',
                      trailing: Obx(
                        () => Switch(
                          value: themeController.isDarkTheme.value,
                          onChanged: (value) {
                            themeController.toggleTheme(value);
                          },
                        ),
                      )),
                  // TSettingMenuTile(
                  //   icon: Iconsax.document_upload,
                  //   title: 'Upload dữ liệu',
                  //   subtitle: 'Upload dữ liệu lên Cloud Firebase',
                  //   onTap: () => Get.to(() => const UploadGeneralScreen()),
                  // ),
                  TSettingMenuTile(
                    icon: Iconsax.security_card,
                    title: 'Chính sách tài khoản',
                    subtitle: 'Xem chính sách tài khoản',
                    onTap: () => Get.to(() => PolicyScreen()),
                  ),

                  //Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () =>
                            AuthenticationRepository.instance.logout(),
                        child: const Text("Đăng xuất")),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
