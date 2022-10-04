import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/assets.dart';
import '../../constants/ui_constants.dart';
import '../../controllers/auth_controller.dart';
import '../../controllers/modal_controller.dart';
import '../../controllers/user_controller.dart';
import '../../utils/text_utils.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/gradient_background.dart';
import '../../widgets/inputs/text_input_form_field.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String firstName = '';
  String lastName = '';

  var loading = false;
  var shouldValidate = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthController authController = Get.find();
  final UserController userController = Get.find();
  final ModalController modalController = Get.find();

  @override
  void initState() {
    super.initState();
  }

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Personal Information', style: Get.theme.textTheme.headline1),
                  const SizedBox(height: Spacing.compact),
                  Text(
                    'Fill in your details to complete your profile',
                    style: Get.theme.textTheme.bodyText1!.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
                  ),
                  const SizedBox(height: Spacing.extraLarge),
                  GestureDetector(
                    onTap: () => modalController.openBottomSheet(ImagePickerBottomSheet()),
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: glassDecoration(),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(Spacing.regular),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            IconPath.laughWink,
                            color: Get.theme.colorScheme.tertiary,
                            fit: BoxFit.fitHeight,
                          ),
                          const SizedBox(height: Spacing.medium),
                          Text(
                            "Add Display Picture",
                            style:
                                Get.theme.textTheme.bodyText2?.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: Spacing.large),
                  Form(
                    key: formKey,
                    autovalidateMode: shouldValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInputFormField(
                          validator: nameValidator,
                          onSaved: (text) => setState(() => firstName = text!),
                          hintText: "Full Name",
                        ),
                        const SizedBox(height: Spacing.regular),
                        TextInputFormField(
                          validator: phoneValidator,
                          onSaved: (text) => setState(() => lastName = text!),
                          hintText: "Phone number",
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: Spacing.regular),
                      ],
                    ),
                  ),
                  const SizedBox(height: Spacing.extraLarge),
                  CustomButton(
                    size: ButtonSize.large,
                    text: 'Submit',
                    width: ButtonWidth.twoThird,
                    onTap: loading ? null : onSubmit,
                    loading: loading,
                  ),
                  const SizedBox(height: Spacing.medium),
                  CustomButton(text: 'Skip', onTap: () {}, loading: loading, textButton: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  onSubmit() async {
    setState(() => shouldValidate = true);
    if (formKey.currentState!.validate()) {
      setState(() => loading = true);
      formKey.currentState!.save();
      await userController.updateUserDetails(firstName: firstName, lastName: lastName);
      setState(() => loading = false);
    }
  }
}
