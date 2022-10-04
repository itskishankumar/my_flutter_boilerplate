import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Function()? onTap;
  final ButtonSize size;
  final ButtonWidth width;
  final ButtonType type;
  final bool loading;
  final bool textButton;
  final bool underline;

  const CustomButton({
    required this.text,
    this.icon,
    this.onTap,
    this.size = ButtonSize.medium,
    this.type = ButtonType.primary,
    this.width = ButtonWidth.flexible,
    this.loading = false,
    this.textButton = false,
    this.underline = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: textButton
          ? Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.secondary),
                  softWrap: false,
                ),
                if (icon != null) const SizedBox(width: Spacing.small),
                if (icon != null) icon!,
              ],
            )
          : Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: buttonColor(),
                border: border(),
              ),
              width: getWidth(context),
              padding: getPadding(),
              child: loading
                  ? Center(
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Get.theme.colorScheme.primary),
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          text,
                          style: Get.theme.textTheme.bodyText1?.copyWith(color: textColor()),
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                        if (icon != null) const SizedBox(width: Spacing.small),
                        if (icon != null) icon!,
                      ],
                    ),
            ),
    );
  }

  Color? textColor() {
    return Get.theme.colorScheme.surface;
  }

  Color? buttonColor() {
    if (onTap == null) {
      return null;
    }
    switch (type) {
      case ButtonType.primary:
        return Get.theme.colorScheme.primary;
      case ButtonType.secondary:
        return null;
    }
  }

  EdgeInsets getPadding() {
    switch (size) {
      case ButtonSize.medium:
        return const EdgeInsets.symmetric(vertical: Spacing.extraSmall, horizontal: Spacing.regular);
      case ButtonSize.large:
        return const EdgeInsets.all(Spacing.compact);
      default:
        return const EdgeInsets.all(Spacing.extraSmall);
    }
  }

  double? getWidth(BuildContext context) {
    switch (width) {
      case ButtonWidth.flexible:
        return null;
      case ButtonWidth.half:
        return MediaQuery.of(context).size.width * 0.5;
      case ButtonWidth.twoThird:
        return MediaQuery.of(context).size.width * 0.65;
      case ButtonWidth.full:
        return double.infinity;
      default:
        return null;
    }
  }

  Border? border() {
    if (onTap == null && !loading) {
      return Border.all(color: Get.theme.colorScheme.primary);
    }
    return Border.all(color: Get.theme.colorScheme.primary);
  }
}
