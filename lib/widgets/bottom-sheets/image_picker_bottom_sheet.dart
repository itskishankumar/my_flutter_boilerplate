import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/assets.dart';

import '../../controllers/modal_controller.dart';
import '../../utils/launcher_utils.dart';
import 'base_bottom_sheet.dart';

class ImagePickerBottomSheet extends StatelessWidget {
  ImagePickerBottomSheet({Key? key}) : super(key: key);

  final ModalController modalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => pickImageFromGallery(),
              child: Column(
                children: [
                  SvgPicture.asset(IconPath.folder, color: Get.theme.colorScheme.surface, fit: BoxFit.fitHeight),
                  const SizedBox(height: Spacing.compact),
                  Text('Choose from gallery', style: Get.theme.textTheme.bodyText2),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => pickImageFromCamera(),
              child: Column(
                children: [
                  SvgPicture.asset(IconPath.camera, color: Get.theme.colorScheme.surface, fit: BoxFit.fitHeight),
                  const SizedBox(height: Spacing.compact),
                  Text('Click a photo', style: Get.theme.textTheme.bodyText2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
