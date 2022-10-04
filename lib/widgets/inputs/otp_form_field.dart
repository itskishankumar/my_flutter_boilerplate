import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../constants/theme.dart';

class OtpFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String?) onSaved;

  const OtpFormField({
    Key? key,
    required this.validator,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      enablePinAutofill: true,
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      textStyle: Get.theme.textTheme.headline3!.copyWith(color: Get.theme.colorScheme.surface),
      animationType: AnimationType.fade,
      showCursor: true,
      cursorColor: Get.theme.primaryColorLight,
      cursorWidth: 1,
      cursorHeight: 25,
      validator: validator,
      errorTextMargin: const EdgeInsets.only(top: 4),
      errorTextSpace: Spacing.medium,
      appContext: context,
      autovalidateMode: AutovalidateMode.disabled,
      pinTheme: PinTheme(
        activeColor: Get.theme.cardColor,
        selectedColor: Get.theme.cardColor,
        inactiveColor: Get.theme.cardColor,
        activeFillColor: Get.theme.cardColor,
        inactiveFillColor: Get.theme.cardColor,
        selectedFillColor: Get.theme.cardColor,
        fieldHeight: 52,
        fieldWidth: 48,
        borderRadius: BorderRadius.circular(12),
        errorBorderColor: Colors.red,
        shape: PinCodeFieldShape.box,
      ),
      onChanged: (_) {},
      onSaved: onSaved,
    );
  }
}
