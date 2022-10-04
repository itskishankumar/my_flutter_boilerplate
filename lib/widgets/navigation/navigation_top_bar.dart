import 'package:flutter/material.dart';
import 'package:flutter_boilterplate/controllers/navigation_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_screens.dart';
import '../../constants/assets.dart';
import '../../constants/theme.dart';
import '../../controllers/modal_controller.dart';
import '../../controllers/network_controller.dart';
import 'navigation_side_bar.dart';

class NavigationTopBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(60.0);

  final NetworkController networkController = Get.find();
  final ModalController modalController = Get.find();
  final NavigationController navigationController = Get.find();

  NavigationTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        leading: false
            ? InkWell(onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios))
            : InkWell(
                onTap: () => modalController.openSideSheet(const NavigationSideBar(), context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.regular),
                  child: SvgPicture.asset(SvgPath.appLogo, color: Get.theme.colorScheme.tertiary),
                ),
              ),
        // leadingWidth: showBackButton(routingController.currentScreen) ? 56 : double.infinity,
        title: Text("title", style: Get.theme.textTheme.headline1),

        centerTitle: true,
        actions: <Widget>[
          InkWell(
            onTap: () => Get.toNamed(AppScreen.allFarmNotifications),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.regular),
              child: SvgPicture.asset(IconPath.bell, color: Get.theme.colorScheme.tertiary),
            ),
          ),
        ],
      ),
    );
  }
}
