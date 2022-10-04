import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/modal_controller.dart';

class BaseBottomSheet extends StatelessWidget {
  final Widget child;

  BaseBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

  final ModalController modalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.onTertiary,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(Spacing.regular),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 6,
            width: 36,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
          ),
          const SizedBox(height: Spacing.medium),
          child,
        ],
      ),
    );
  }
}
