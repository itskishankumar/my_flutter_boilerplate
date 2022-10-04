import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../constants/firebase_error_overrides.dart';
import '../constants/theme.dart';
import 'toast_utils.dart';

void handleError(dynamic error) {
  showToast(title: "Error", message: _getErrorMessage(error), snackBarVariant: SnackBarVariant.error);
}

String _getErrorMessage(dynamic error) {
  if (error.runtimeType == auth.FirebaseAuthException) {
    return firebaseErrorOverrides[error.code] ?? error.message;
  } else if (error.runtimeType == DioError) {
    if (error?.response?.data?['message'].runtimeType == List) {
      return error.response.data['message'][0];
    }
    return error.response.data['message'];
  }
  return "Something went wrong";
}
