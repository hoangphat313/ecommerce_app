import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:e_commerce/features/shop/screens/search/search_screen.dart';
import 'package:e_commerce/features/shop/screens/store/store.dart';
import 'package:e_commerce/features/shop/screens/wishlist/wishlist.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
                items: const [
                  Icon(Iconsax.home, size: 25),
                  Icon(Iconsax.search_favorite, size: 25),
                  Icon(Iconsax.shop, size: 25),
                  Icon(Iconsax.heart, size: 25),
                  Icon(Iconsax.user, size: 25)
                ],
                index: controller.selectedIndex.value,
                height: 45,
                color: dark ? TColors.black : TColors.primary.withOpacity(0.8),
                backgroundColor: dark ? TColors.black : TColors.white,
                buttonBackgroundColor: dark
                    ? TColors.white.withOpacity(0.1)
                    : TColors.black.withOpacity(0.1),
                onTap: (index) => controller.selectedIndex.value = index,
              )
          // () => NavigationBar(
          //   height: 70,
          //   elevation: 0,
          //   selectedIndex: controller.selectedIndex.value,
          //   onDestinationSelected: (index) =>
          //       controller.selectedIndex.value = index,
          //   backgroundColor: dark ? TColors.black : TColors.white,
          //   indicatorColor: dark
          //       ? TColors.white.withOpacity(0.1)
          //       : TColors.black.withOpacity(0.1),
          //   destinations: const [
          //     NavigationDestination(icon: Icon(Iconsax.home), label: 'Trang Chủ'),
          //     NavigationDestination(icon: Icon(Iconsax.shop), label: 'Cửa Hàng'),
          //     NavigationDestination(
          //         icon: Icon(Iconsax.heart), label: 'Yêu Thích'),
          //     NavigationDestination(icon: Icon(Iconsax.user), label: 'Tài Khoản'),
          //   ],
          // ),
          ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    SearchPage(),
    const StoreScreen(),
    const FavouriteScreen(),
    const SettingsScreen(),
  ];
}
