import 'dart:ui';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

String? phoneValidator(String? phone) {
  if (phone!.isEmpty || !phoneNumberMatch(phone)) {
    return "Please enter a valid 10 digit phone number";
  }
  return null;
}

String? otpValidator(String? otp) {
  if (!otpMatch(otp!)) {
    return "Please enter the entire 6 digit OTP";
  }
  return null;
}

String? nameValidator(String? name) {
  if (name!.isEmpty) {
    return 'Please enter your name';
  } else if (!nameMatch(name)) {
    return 'Valid characters can only include a-z, A-Z';
  }
  return null;
}

String? emptyStringValidator(String? string) {
  if (StringUtils.isNullOrEmpty(string)) {
    return 'Please enter a value';
  }
  return null;
}

String? emailValidator(String? email) {
  if (!EmailUtils.isEmail(email!)) {
    return 'Please enter a valid email';
  }
  return null;
}

String? removeCountryCode(String? phoneNumber) {
  return phoneNumber?.substring(3);
}

bool phoneNumberMatch(String phoneNumber) => RegExp(r'^[0-9]{10}$').hasMatch(phoneNumber);

bool nameMatch(String name) => RegExp(r'^[a-zA-Z \.]+$').hasMatch(name);

bool otpMatch(String otp) => RegExp(r'^[0-9]{6}$').hasMatch(otp);

extension StringExtension on String {
  String capitalizeFirstLetter() => StringUtils.capitalize(this);
}

Paint applyGradient(Color color1, Color color2) {
  return Paint()
    ..shader = LinearGradient(
      colors: <Color>[color1, color2],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));
}
