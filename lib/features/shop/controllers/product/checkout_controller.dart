import 'package:e_commerce/common/widgets/list_tiles/payment_tile.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/payment_method_model.dart';
import 'package:e_commerce/utils/constants/image_strings.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.momo, name: 'Thanh toán bằng Momo');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(
                  title: 'Chọn phương thức thanh toán',
                  showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwSections),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: TImages.momo, name: 'Thanh toán bằng Momo')),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              PaymentTile(
                  paymentMethod: PaymentMethodModel(
                      image: TImages.COD, name: 'Thanh toán khi nhận hàng')),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}
