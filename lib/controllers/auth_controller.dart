import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/app_screens.dart';
import '../repositories/user_repository.dart';
import '../services/shared_prefs_service.dart';
import '../utils/error_utils.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _verificationId;
  String? _userEmailId;
  String? _userPhoneNumber;

  Timer _resendTimer = Timer(const Duration(milliseconds: 1), () {});

  final _loading = false.obs;
  final _timeToResend = 30.obs;

  int get timeToResend => _timeToResend.value;

  bool get loading => _loading.value;

  String? get userEmailID => _userEmailId;

  String? get userPhoneNumber => _userPhoneNumber;

  UserRepository userRepository = UserRepository();

  void _startTimer() {
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      _timeToResend.value--;
      if (_timeToResend.value == 0) {
        _cancelTimer();
      }
    });
  }

  void _cancelTimer() {
    _timeToResend.value = 30;
    _resendTimer.cancel();
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    _loading.value = true;
    _userPhoneNumber = phoneNumber;
    _cancelTimer();
    try {
      if (_timeToResend.value == 30) {
        await _firebaseAuth.verifyPhoneNumber(
          phoneNumber: _userPhoneNumber,
          verificationCompleted: (AuthCredential authCredential) async {
            await _signInWithCredential(authCredential);
          },
          verificationFailed: (FirebaseAuthException authException) {
            _loading.value = false;
            handleError(authException);
          },
          codeSent: (String verificationId, int? forceResendingToken) {
            _verificationId = verificationId;
            _startTimer();
            Get.toNamed(AppScreen.otpVerification);
            _loading.value = false;
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationId = verificationId;
          },
        );
      }
    } catch (e) {
      _loading.value = false;
      handleError(e);
    }
  }

  Future<void> finishPhoneNumberSignup(String otp) async {
    await _signInWithCredential(PhoneAuthProvider.credential(verificationId: _verificationId!, smsCode: otp));
  }

  Future<void> signInWithEmail(String emailId) async {
    _loading.value = true;
    _userEmailId = emailId;
    _cancelTimer();
    try {
      await _firebaseAuth.sendSignInLinkToEmail(
        email: emailId,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://www.example.com/finishSignUp?cartId=1234',
          handleCodeInApp: true,
          iOSBundleId: 'com.example.ios',
          androidPackageName: 'com.example.android',
          androidInstallApp: true,
        ),
      );
      _startTimer();
      // Get.toNamed(AppScreen.emailRedirect);
      SharedPrefsService.setEmailIdForSignIn(emailId);
      _loading.value = false;
    } catch (e) {
      handleError(e);
      _loading.value = false;
    }
  }

  Future<void> finishEmailSignup(String emailLink) async {
    String? email = await SharedPrefsService.getEmailIdForSignIn();
    final authCredential = EmailAuthProvider.credentialWithLink(email: email!, emailLink: emailLink);
    await _signInWithCredential(authCredential);
  }

  Future<void> signInWithGoogle() async {
    try {
      _loading.value = true;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      _loading.value = false;
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await _signInWithCredential(authCredential);
    } catch (e) {
      _loading.value = false;
    }
  }

  Future<void> _signInWithCredential(AuthCredential authCredential) async {
    _loading.value = true;
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);
      if (userCredential.additionalUserInfo?.isNewUser == true) {
        // Get.put(UserController(), permanent: true);
        await userRepository.createUser(userCredential);
      } else {}
    } catch (e) {
      _loading.value = false;
      handleError(e);
    }
    _loading.value = false;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();
    userRepository.clearCache();
  }
}
