import 'package:easy_localization/easy_localization.dart';

class Validator {
  static String? validateName(value) {
    if (value.isEmpty) {
      return 'Enter Name'.tr();
    } else {
      return null;
    }
  }

  static String? validateAddress(value) {
    if (value.isEmpty) {
      return 'Enter Address'.tr();
    } else {
      return null;
    }
  }

  static String? validateMobile(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.length == 0) {
      return '⚠️  ${'Please Enter Phone'.tr()}';
    } else if (!regExp.hasMatch(value)) {
      return '⚠️  ${'Phone Must be digits'.tr()}';
    }
    return null;
  }

  static String? validateEmail(value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '⚠️  ${'please enter your email address'.tr()}';
    } else if (!regExp.hasMatch(value.toString().trim())) {
      return '⚠️  ${'Invalid Email'.tr()}';
    } else {
      return null;
    }
  }
}
