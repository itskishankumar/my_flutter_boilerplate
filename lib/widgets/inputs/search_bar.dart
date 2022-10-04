import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';

class SearchBar extends StatelessWidget {
  final Function(String?)? onChanged;
  final bool disabled;
  final bool autofocus;
  final Widget? suffix;

  const SearchBar({
    Key? key,
    this.onChanged,
    this.disabled = false,
    this.autofocus = false,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Get.theme.cardColor),
      ),
      child: TextField(
        autofocus: autofocus,
        enabled: !disabled,
        style: Get.theme.textTheme.bodyText1,
        onChanged: onChanged,
        cursorColor: Get.theme.colorScheme.surface,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: Get.theme.textTheme.bodyText1!.copyWith(color: Get.theme.colorScheme.tertiaryContainer),
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.all(Spacing.regular),
          suffixIcon: Padding(padding: const EdgeInsetsDirectional.only(end: Spacing.regular), child: suffix),
        ),
      ),
    );
  }
}
