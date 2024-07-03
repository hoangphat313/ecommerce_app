import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/appbar/tabbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_commerce/features/shop/controllers/category_controller.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        //-- AppBar
        appBar: TAppBar(
          title: Text(
            'Cửa hàng',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon()],
        ),
        body: NestedScrollView(
          //-- Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? Colors.black
                    : TColors.white,
                toolbarHeight: 0,
                expandedHeight: kToolbarHeight,
                // Tabs
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(
                              child: Text(
                            category.name,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )))
                      .toList(),
                ),
              ),
            ];
          },
          // Body
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
