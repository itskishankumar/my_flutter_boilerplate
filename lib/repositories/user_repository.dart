import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:get/get.dart';

import '../constants/api_routes.dart';
import '../controllers/network_controller.dart';
import '../models/user/user.dart';

class UserRepository {
  final NetworkController _networkController = Get.find();

  Future<void> createUser(firebase_auth.UserCredential userCredential) async {
    await _networkController.post(url: ApiRoute.users[UsersApiRoute.base]!, body: {
      "phoneNumber": userCredential.user!.phoneNumber,
      "uid": userCredential.user!.uid,
      "emailId": userCredential.user!.email,
    });
  }

  Future<User?> getUserDetails() async {
    final response = await _networkController.get(url: ApiRoute.users[UsersApiRoute.me]!);
    if (response.runtimeType != DioError && response.runtimeType != Error) {
      return User.fromJson(response);
    }
    return null;
  }

  Future<void> updateUserDetails({
    required String firstName,
    required String lastName,
    String? phoneNumber,
    String? emailId,
  }) async {
    Map<String, dynamic> body = {};
    body.addAll({'firstName': firstName, 'lastName': lastName});
    body.addIf(phoneNumber != null, "phoneNumber", phoneNumber);
    body.addIf(emailId != null, "emailId", emailId);
    await _networkController.patch(
      url: ApiRoute.users[UsersApiRoute.me]!,
      body: body,
    );
  }

  void clearCache() {
    _networkController.clearCache();
  }
}
