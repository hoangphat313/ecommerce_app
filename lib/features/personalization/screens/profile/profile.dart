import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/t_circular_image.dart';
import 'package:e_commerce/common/widgets/shimmer/shimmer.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Thông tin cá nhân'),
        showBackArrow: true,
      ),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageLoading.value
                          ? const TShimmerEffect(
                              width: 90,
                              height: 90,
                              radius: 90,
                            )
                          : TCircularImage(
                              image: image,
                              width: 100,
                              height: 100,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadProfilePicture(),
                        child: const Text('Thay đổi ảnh'))
                  ],
                ),
              ),
              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                  title: 'Thông tin cá nhân', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Tên',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(const ChangeName())),
              TProfileMenu(
                  title: 'Username',
                  value: controller.user.value.username,
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              //Heading Personal info
              TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.id));
                    TLoaders.successSnackBar(
                        title: 'Chúc mừng', message: 'Copy thành công userID');
                  }),
              TProfileMenu(
                  title: 'Email',
                  value: controller.user.value.email,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.email));
                    TLoaders.successSnackBar(
                        title: 'Chúc mừng', message: 'Copy thành công Email');
                  }),
              TProfileMenu(
                  title: 'Số điện thoại',
                  value: controller.user.value.phoneNumber,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: controller.user.value.phoneNumber));
                    TLoaders.successSnackBar(
                        title: 'Chúc mừng',
                        message: 'Copy thành công số điện thoại');
                  }),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              //button
              // Center(
              //   child: TextButton(
              //       onPressed: () =>
              //           controller.deleteAccountWarningPopup(context),
              //       child: const Text(
              //         'Xóa tài khoản',
              //         style: TextStyle(
              //           color: Colors.red,
              //         ),
              //       )),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
