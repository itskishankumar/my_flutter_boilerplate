import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import '../../constants/ui_constants.dart';

// TODO: Tooltip design
class Tooltip extends StatelessWidget {
  const Tooltip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      content: Container(
        decoration: BoxDecoration(color: Get.theme.colorScheme.onTertiary, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(Spacing.regular),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Room 1", style: Get.theme.textTheme.bodyText1),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: Get.theme.colorScheme.tertiary),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(Spacing.regular),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Room 2", style: Get.theme.textTheme.bodyText1),
                ),
              ),
            ),
            Divider(height: 1, thickness: 1, color: Get.theme.colorScheme.tertiary),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(Spacing.regular),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text("Room 3", style: Get.theme.textTheme.bodyText1),
                ),
              ),
            ),
          ],
        ),
      ),
      preferredDirection: AxisDirection.down,
      isModal: true,
      child: const Material(
        color: Colors.transparent,
        child: Padding(padding: EdgeInsets.all(8.0), child: Icon(Icons.category, color: Colors.white)),
      ),
    );
  }
}
