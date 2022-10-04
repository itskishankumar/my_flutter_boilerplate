import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_screens.dart';

class NavigationBottomBar extends StatelessWidget {
  final RoutingController routingController = Get.find();

  NavigationBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: routingController.currentScreen == AppScreen.home
                ? Icon(Icons.home_filled, color: Get.theme.colorScheme.primary)
                : const Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: routingController.currentScreen == AppScreen.home
                ? Icon(Icons.sports_mma, color: Get.theme.colorScheme.primary)
                : const Icon(Icons.sports_mma),
            label: 'Fight Me',
          ),
          BottomNavigationBarItem(
            icon: routingController.currentScreen == AppScreen.home
                ? Icon(Icons.group, color: Get.theme.colorScheme.primary)
                : const Icon(Icons.group),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: routingController.currentScreen == AppScreen.home
                ? Icon(Icons.notifications, color: Get.theme.colorScheme.primary)
                : const Icon(Icons.notifications),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: routingController.currentScreen == AppScreen.home
                ? Icon(Icons.leaderboard, color: Get.theme.colorScheme.primary)
                : const Icon(Icons.leaderboard),
            label: 'Ranking',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppScreen.home);
              break;
            case 1:
              Get.toNamed(AppScreen.home);
              break;
            case 2:
              Get.toNamed(AppScreen.home);
              break;
            case 3:
              Get.toNamed(AppScreen.home);
              break;
            case 4:
              Get.toNamed(AppScreen.home);
              break;
          }
        },
      ),
    );
  }
}
