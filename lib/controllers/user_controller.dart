import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

import '../models/user/user.dart';
import '../repositories/user_repository.dart';

class UserController extends GetxController {
  final Stream<auth.User?> _authStream = auth.FirebaseAuth.instance.authStateChanges();

  final _initialised = false.obs;
  final _isLoggedIn = false.obs;
  final Rxn<User> _user = Rxn<User>();
  final _forceAppUpdate = false.obs;
  final _forceUpdateMessage = "".obs;

  Rx<bool> get initialised => _initialised;

  bool get isLoggedIn => _isLoggedIn.value;

  User? get user => _user.value;

  Rxn<User> get userStream => _user;

  bool get forceAppUpdate => _forceAppUpdate.value;

  String get forceUpdateMessage => _forceUpdateMessage.value;

  set forceAppUpdate(bool value) => _forceAppUpdate.value = value;

  set forceUpdateMessage(String value) => _forceUpdateMessage.value = value;

  UserRepository userRepository = UserRepository();

  @override
  void onInit() {
    super.onInit();
    _authStream.listen((auth.User? authUser) async {
      _initialised.value = false;
      if (authUser == null) {
        _isLoggedIn.value = false;
        _user.value = null;
        _initialised.value = true;
      } else {
        _isLoggedIn.value = true;
        await getUserDetails();
        _initialised.value = true;
      }
    });
  }

  Future<void> getUserDetails() async {
    _user.value = await userRepository.getUserDetails();
  }

  Future<void> updateUserDetails({
    required String firstName,
    required String lastName,
    String? phoneNumber,
    String? emailId,
  }) async {
    await userRepository.updateUserDetails(firstName: firstName, lastName: lastName);
  }
}
