import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/theme.dart';

class TaskCard extends StatelessWidget {
  final CardType cardType;

  const TaskCard({
    Key? key,
    required this.cardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (cardType) {
      case CardType.small:
        return small();
      case CardType.large:
        return large();
      default:
        return large();
    }
  }
}

Widget small() {
  return Container(
    padding: const EdgeInsets.all(Spacing.compact),
    width: double.infinity,
    child: Row(
      children: [
        SvgPicture.asset(IconPath.bell, color: Get.theme.colorScheme.primaryContainer),
        const SizedBox(width: Spacing.compact),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('Task name', style: Get.theme.textTheme.bodyText1),
                  const Spacer(),
                  Text(
                    'DD/MM/YY',
                    style: Get.theme.textTheme.overline?.copyWith(color: Get.theme.colorScheme.tertiary),
                  ),
                ],
              ),
              const SizedBox(height: Spacing.small),
              Text('Description', style: Get.theme.textTheme.bodyText2),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget large() {
  return Container(
    padding: const EdgeInsets.all(Spacing.regular),
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Task Type*', style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiary)),
        const SizedBox(height: Spacing.extraSmall),
        Text('Transfer Task', style: Get.theme.textTheme.bodyText2),
        const SizedBox(height: Spacing.regular),
        Text('Task Completion Date*',
            style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiary)),
        const SizedBox(height: Spacing.extraSmall),
        Text('02/09/22', style: Get.theme.textTheme.bodyText2),
        const SizedBox(height: Spacing.regular),
        Text('Select Worker*', style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiary)),
        const SizedBox(height: Spacing.extraSmall),
        Text('Amit Bukhara', style: Get.theme.textTheme.bodyText2),
        const SizedBox(height: Spacing.regular),
        Text('Task Description*',
            style: Get.theme.textTheme.bodyText1?.copyWith(color: Get.theme.colorScheme.tertiary)),
        const SizedBox(height: Spacing.extraSmall),
        Text(
          "I'm going to hire professional help tomorrow. I can't handle this anymore. She fell over the coffee table and now there is blood in her catheter. This is much more than I ever signed up to do.",
          style: Get.theme.textTheme.bodyText2,
        ),
      ],
    ),
  );
}
