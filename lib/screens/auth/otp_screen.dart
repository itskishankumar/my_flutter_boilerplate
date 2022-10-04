import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/ui_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/text_utils.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/gradient_background.dart';
import '../../widgets/inputs/otp_input_form_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var shouldValidate = false;
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return applyGradientBackground(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.regular),
              child: Column(
                children: [
                  Text(
                    'Welcome to App!',
                    style: Get.theme.textTheme.headline1?.copyWith(
                      foreground: applyGradient(const Color(0xff00FFA3), const Color(0xffFFFFFF)),
                    ),
                  ),
                  const SizedBox(height: Spacing.compact),
                  Text(
                    "OTP sent to ${authController.userPhoneNumber}",
                    style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
                  ),
                  const SizedBox(height: Spacing.medium),
                  Form(
                    key: otpFormKey,
                    autovalidateMode: shouldValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
                    child: OtpInputFormField(
                      validator: otpValidator,
                      onSaved: (otp) => authController.finishPhoneNumberSignup(otp!),
                      // onSaved: () {},
                    ),
                  ),
                  const SizedBox(height: Spacing.medium),
                  Obx(
                    () => CustomButton(
                      size: ButtonSize.large,
                      text: 'Confirm OTP',
                      width: ButtonWidth.full,
                      onTap: authController.loading ? null : onSubmit,
                      loading: authController.loading,
                    ),
                  ),
                  const SizedBox(height: Spacing.medium),
                  CustomButton(
                    text: "Change Phone Number",
                    onTap: () => Get.back(),
                    textButton: true,
                  ),
                  const SizedBox(height: Spacing.regular),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Didn’t Receive the OTP?", style: Get.theme.textTheme.bodyText1),
                      const SizedBox(width: Spacing.small),
                      Obx(
                        () => CustomButton(
                          text:
                              authController.timeToResend != 30 ? "Resend (${authController.timeToResend})" : "Resend",
                          onTap: () => authController.signInWithPhoneNumber(authController.userPhoneNumber!),
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

  onSubmit() {
    setState(() => shouldValidate = true);
    if (otpFormKey.currentState!.validate()) {
      otpFormKey.currentState!.save();
    }
  }
}
