import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';

class PolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Chính sách'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
        child: ListView(
          children: const <Widget>[
            PolicySection(
              title: 'Chính sách bảo mật',
              content: TTexts.securiryPolicy,
            ),
            SizedBox(height: 20),
            PolicySection(
                title: 'Chính sách tài khoản', content: TTexts.accountPolicy),
          ],
        ),
      ),
    );
  }
}

class PolicySection extends StatelessWidget {
  final String title;
  final String content;

  const PolicySection({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: TColors.primary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: dark ? TColors.white : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
