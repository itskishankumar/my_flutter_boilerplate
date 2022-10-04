import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/ui_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../utils/text_utils.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/inputs/custom_text_form_field.dart';
import '../../widgets/inputs/text_input_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool shouldValidate = false;
  bool isLogin = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                padding: const EdgeInsets.only(top: Spacing.large),
                child: ShaderMask(
                  shaderCallback: (bounds) => primaryColorGradientShader(bounds, secondary: true),
                  child: SvgPicture.asset(SvgPath.pattern1),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                padding: const EdgeInsets.only(
                  left: Spacing.regular,
                  right: Spacing.regular,
                  top: Spacing.regular,
                  bottom: Spacing.large,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.end, children: [SvgPicture.asset(SvgPath.appLogo)]),
                        isLogin
                            ? Text('Log In.', style: Get.theme.textTheme.headline3)
                            : Text('Sign Up.', style: Get.theme.textTheme.headline3),
                        const SizedBox(height: Spacing.regular),
                        Text(
                          'Enter Your Email',
                          style: Get.theme.textTheme.bodyText2!.copyWith(color: Get.theme.colorScheme.secondary),
                        ),
                        const SizedBox(height: Spacing.small),
                        Form(
                          key: formKey,
                          autovalidateMode: shouldValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                onTap: () => phoneTextController.clear(),
                                controller: emailTextController,
                                validator: (text) {
                                  if (phoneTextController.text == "") {
                                    return emailValidator(text);
                                  }
                                  return null;
                                },
                                hintText: "Input",
                              ),
                              const SizedBox(height: Spacing.small),
                              Text('or', style: Get.theme.textTheme.bodyText1),
                              const SizedBox(height: Spacing.small),
                              CustomTextFormField(
                                onTap: () => emailTextController.clear(),
                                controller: phoneTextController,
                                keyboardType: TextInputType.number,
                                validator: (text) {
                                  if (emailTextController.text == "") {
                                    return phoneValidator(text);
                                  }
                                  return null;
                                },
                                hintText: "Input",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: Spacing.regular),
                        Obx(
                          () => CustomButton(
                            text: 'Continue',
                            icon: Icons.arrow_forward_ios,
                            size: ButtonSize.large,
                            width: ButtonWidth.full,
                            onTap: authController.loading ? null : onSubmit,
                            loading: authController.loading,
                          ),
                        ),
                        const SizedBox(height: Spacing.regular),
                        Text('or', style: Get.theme.textTheme.bodyText1),
                        const SizedBox(height: Spacing.regular),
                        GestureDetector(
                          onTap: () => authController.signInWithGoogle(),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(PngPath.googleLogo, fit: BoxFit.fitHeight, height: 40),
                                const SizedBox(width: Spacing.small),
                                Text(
                                  "Sign in with Google",
                                  style: Get.theme.textTheme.buttonText1.copyWith(color: const Color(0xff1C1B1B)),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: Spacing.regular),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.white),
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(PngPath.appleLogo, fit: BoxFit.fitHeight, height: 40),
                                const SizedBox(width: Spacing.small),
                                Text(
                                  "Sign in with Apple",
                                  style: Get.theme.textTheme.buttonText1.copyWith(color: const Color(0xff1C1B1B)),
                                  textAlign: TextAlign.center,
                                  softWrap: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: Spacing.regular),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            isLogin
                                ? Text("Don't have an account?", style: Get.theme.textTheme.bodyText1)
                                : Text('Already have an account?', style: Get.theme.textTheme.bodyText1),
                            const SizedBox(width: Spacing.small),
                            isLogin
                                ? CustomButton(
                                    text: "Sign In",
                                    onTap: () => setState(() => isLogin = false),
                                    textButton: true,
                                  )
                                : CustomButton(
                                    text: "Log In",
                                    onTap: () => setState(() => isLogin = true),
                                    textButton: true,
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onSubmit() {
    setState(() => shouldValidate = true);
    if (formKey.currentState!.validate()) {
      if (emailTextController.text != '') {
        authController.signInWithEmail(emailTextController.text);
      } else if (phoneTextController.text != '') {
        authController.signInWithPhoneNumber("+91${phoneTextController.text.trim()}");
      }
    }
  }
}
