import 'package:e_commerce/features/shop/controllers/product/cart_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/formatters/formatter.dart';
import 'package:e_commerce/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng giá trị sản phẩm:',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(TFormatter.formatCurrency(subTotal),
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        //Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Phí giao hàng: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                TFormatter.formatCurrency(double.parse(
                    TPricingCalculator.calculateShippingCost(subTotal, 'VN'))),
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        //Tax fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Chi phí thuế: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                TFormatter.formatCurrency(double.parse(
                    TPricingCalculator.calculateTax(subTotal, 'VN'))),
                style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tổng hóa đơn: ',
                style: Theme.of(context).textTheme.bodyMedium),
            Text(
                TFormatter.formatCurrency(
                    (TPricingCalculator.calculateTotalPrice(subTotal, 'VN'))),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
