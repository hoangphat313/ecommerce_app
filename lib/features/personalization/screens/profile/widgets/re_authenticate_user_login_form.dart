import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
          title: Text('Xác Thực Lại Người Dùng'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.direct_right),
                        labelText: TTexts.email),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  //Password
                  Obx(
                    () => TextFormField(
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          TValidator.validateEmptyText('Password', value),
                      obscureText: controller.hidePassword.value,
                      decoration: InputDecoration(
                        labelText: TTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  //login button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPasswordUser(),
                        child: const Text('Xác thực')),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
