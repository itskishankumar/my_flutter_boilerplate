import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.backgroundColor,
      child: Center(child: Image.asset(ImagePath.someImage, fit: BoxFit.fitHeight, height: 32)),
    );
  }
}
