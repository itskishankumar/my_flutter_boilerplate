import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

abstract class AppScreen {
  static const String splash = '/splash';
  static const String welcome = "/welcome";

  static const String login = "/auth/login";

  static const String home = "/";
}

const screenDisplayName = {
  AppScreen.home: 'Home',
};

// Add your app screens here
final appScreens = [
  GetPage(
    name: AppScreen.splash,
    page: () => SplashScreen(),
    transition: Transition.cupertino,
  ),
  GetPage(
    name: AppScreen.home,
    page: () => const HomeScreen(),
    transition: Transition.cupertino,
  ),
];

List<String> accountSectionScreens = [];
