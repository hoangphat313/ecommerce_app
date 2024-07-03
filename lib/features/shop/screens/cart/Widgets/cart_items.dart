import 'package:e_commerce/common/widgets/products/cart/add_remove_button.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
      () => ListView.separated(
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          shrinkWrap: true,
          itemCount: cartController.cartItems.length,
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    //Cart Item
                    TCartItem(cartItem: item),
                    if (showAddRemoveButton)
                      const SizedBox(height: TSizes.spaceBtwItems),
                    //Add remove button row with total price
                    if (showAddRemoveButton)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //extra space
                              SizedBox(width: 70),
                              //Add remove button
                              TProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => cartController.AddOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),
                          TProductPriceText(
                              price: TFormatter.formatCurrency(
                                  (item.price * item.quantity))),
                        ],
                      )
                  ],
                );
              })),
    );
  }
}
