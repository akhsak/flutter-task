import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task/model/user_model.dart';
import 'package:task/service/authantication_service.dart';

class AuthController extends ChangeNotifier {
  final AuthenticationService authService = AuthenticationService();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController userNameController = TextEditingController();
  // final createFullNameController = TextEditingController();
  final createEmailController = TextEditingController();
  final createPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController createAgeController = TextEditingController();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final fillAccountFormkey = GlobalKey<FormState>();

  final createFormKey = GlobalKey<FormState>();

  final otpFormKey = GlobalKey<FormState>();

  String? emailError;
  String? passwordError;
  int currentIndex = 0;
  UserModel? currentUser;
  bool showPassword = true;
  bool showOtpField = false;

  bool loginObscureText = true;
  void loginObscureTextchange() {
    loginObscureText = !loginObscureText;
    notifyListeners();
  }

  bool createObscureText = true;
  void createObscureTextchange() {
    createObscureText = !createObscureText;
    notifyListeners();
  }

  void clearPhoneController() {
    createAgeController.clear();
  }

  void clearOtpController() {
    otpController.clear();
  }

  void clearSignupControllers() {
    userNameController.clear();
    createEmailController.clear();
    createPasswordController.clear();
    phoneController.clear();
    createAgeController.clear();
  }

  void clearLoginControllers() {
    loginEmailController.clear();
    loginPasswordController.clear();
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError = 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$')
        .hasMatch(value)) {
      emailError = 'Please enter a valid email address';
    } else {
      emailError = null;
    }
    notifyListeners();
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError = 'Please enter your password';
    } else {
      passwordError = null;
    }
    notifyListeners();
  }

  Future<void> googleSignIn(BuildContext context) async {
    try {
      await authService.googleSignIn();
      notifyListeners();
    } catch (e) {
      notifyListeners();
    }
  }

  Future<void> googleSignOut() async {
    await authService.googleSignOut();

    notifyListeners();
  }

  Future<void> getUser() async {
    currentUser = await authService.getCurrentUser();
    if (currentUser != null) {
      log(currentUser!.email!);
    }
    notifyListeners();
  }

  Future<void> updateUserProfile(
      String fullName,
      String age,
      String countryCode,
      String phoneNumber,
      String email,
      String profilepic) async {
    if (currentUser != null) {
      currentUser!.userName = fullName;
      currentUser!.age = age;
      // currentUser!.countryCode = countryCode;
      currentUser!.phoneNumber = phoneNumber;
      currentUser!.email = email;
      currentUser!.profilepic = profilepic;

      notifyListeners();
    }
  }

  Future<void> getOtp(phoneCon) async {
    await authService.getOtp(phoneCon);
    notifyListeners();
  }

  Future<void> verifyOtp(otp, context) async {
    await authService.verifyOtp(otp, context, context);
    notifyListeners();
  }

  Future<void> showOtp() async {
    showOtpField = true;
    notifyListeners();
  }

  Future clearControllers() async {
    userNameController.clear();
    loginEmailController.clear();
    loginPasswordController.clear();
    phoneController.clear();
    createAgeController.clear();
    otpController.clear();
    notifyListeners();
  }

  onTabTapped(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
