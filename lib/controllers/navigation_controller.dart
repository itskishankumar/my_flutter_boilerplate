import 'package:get/get.dart';

import 'modal_controller.dart';

class NavigationController extends GetxController {
  final _currentScreen = "".obs;

  String get currentScreen => _currentScreen.value;

  ModalController modalController = Get.find();

  void setCurrentScreen(Routing routing) {
    if (routing.isBottomSheet == true || routing.isDialog == true) {
      return;
    }
    _currentScreen.value = routing.current;
    if (modalController.isModalOpen) {
      modalController.isModalOpen = false;
    }
  }
}
