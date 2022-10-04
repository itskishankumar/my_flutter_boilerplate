import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.initialValue,
    this.validator,
    this.controller,
    this.focusNode,
    this.onTap,
    this.onSaved,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regularTextBoxBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Get.theme.cardColor),
    );

    return TextFormField(
      maxLines: maxLines,
      onTap: onTap,
      onSaved: onSaved,
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.start,
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.number ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: Get.theme.textTheme.bodyText1,
      validator: validator,
      initialValue: initialValue,
      cursorColor: Get.theme.colorScheme.surface,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(Spacing.regular),
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        filled: true,
        fillColor: Get.theme.cardColor,
        hintText: hintText,
        hintStyle: Get.theme.textTheme.bodyText1!.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
        enabledBorder: regularTextBoxBorder,
        disabledBorder: regularTextBoxBorder,
        focusedBorder: regularTextBoxBorder,
        focusedErrorBorder: regularTextBoxBorder,
        errorBorder: regularTextBoxBorder,
      ),
    );
  }
}
