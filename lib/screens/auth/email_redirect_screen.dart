import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/ui_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/launcher_utils.dart';
import '../../utils/text_utils.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/gradient_background.dart';

class EmailRedirectScreen extends StatefulWidget {
  const EmailRedirectScreen({Key? key}) : super(key: key);

  @override
  State<EmailRedirectScreen> createState() => _EmailRedirectScreenState();
}

class _EmailRedirectScreenState extends State<EmailRedirectScreen> {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return applyGradientBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to App!',
                    style: Get.theme.textTheme.headline1?.copyWith(
                      foreground: applyGradient(const Color(0xff00FFA3), const Color(0xffFFFFFF)),
                    ),
                  ),
                  const SizedBox(height: Spacing.compact),
                  Text(
                    'A link has been sent to ${authController.userEmailID}. Click on it to start using the app.',
                    style: Get.theme.textTheme.bodyText1!.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: Spacing.medium),
                  CustomButton(
                    text: "Open your Email App",
                    icon: SvgPicture.asset(IconPath.send, color: Get.theme.colorScheme.surface, fit: BoxFit.fitHeight),
                    size: ButtonSize.large,
                    onTap: () => openMailApp(context),
                    width: ButtonWidth.twoThird,
                  ),
                  const SizedBox(height: Spacing.medium),
                  CustomButton(text: "Change Email Address", onTap: () => Get.back(), textButton: true),
                  const SizedBox(height: Spacing.regular),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Didn’t Receive the Link?", style: Get.theme.textTheme.bodyText1),
                      const SizedBox(width: Spacing.small),
                      Obx(
                        () => CustomButton(
                          text:
                              authController.timeToResend != 30 ? "Resend (${authController.timeToResend})" : "Resend",
                          onTap: () => authController.signInWithEmail(authController.userEmailID!),
                          textButton: true,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
