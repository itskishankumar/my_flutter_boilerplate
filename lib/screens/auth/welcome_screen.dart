import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_screens.dart';
import '../../constants/assets.dart';
import '../../constants/ui_constants.dart';
import '../../widgets/buttons/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(Spacing.regular),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('App intro', style: Get.theme.textTheme.headline1),
                const SizedBox(height: Spacing.medium),
                CustomButton(
                  text: "Get Started",
                  icon: Icons.arrow_forward_ios,
                  onTap: () => Get.toNamed(AppScreen.home),
                  width: ButtonWidth.full,
                  size: ButtonSize.large,
                  type: ButtonType.primary,
                ),
                const SizedBox(height: Spacing.regular),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Already have an account?', style: Get.theme.textTheme.bodyText1),
                    const SizedBox(width: Spacing.small),
                    CustomButton(text: "Log In", onTap: () {}, textButton: true),
                  ],
                ),
                const SizedBox(height: Spacing.regular),
                Text('Terms and Conditions', style: Get.theme.textTheme.bodyText1),
                const SizedBox(height: Spacing.extraSmall),
                Text('Privacy Policy', style: Get.theme.textTheme.bodyText1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
