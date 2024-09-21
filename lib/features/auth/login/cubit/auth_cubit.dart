import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../core/const/utils.dart';
import '../../../../core/data/api/api.dart';
import '../../../../core/data/local/cacheHelper.dart';
import '../../../../core/dialoges/toast.dart';
import '../../../../core/keys/keys.dart';
import '../../../../core/router/router.dart';
import '../../../home/view.dart';
import '../login.dart';

part 'auth_state.dart';

class SmartAutoLoginCubit extends Cubit<SmartAutoLoginStates> {
  SmartAutoLoginCubit() : super(LoginInitial());
  static SmartAutoLoginCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;
  bool value = true;
  bool socialAuth = false;
  Connectivity connectivity = Connectivity();
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    emit(SelfLabChangePasswordVisibilityState());
  }

  var phone;
  signIn(email, password, context, selectedGender) async {
    emit(SignInLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again'.tr(),
            state: ToastedStates.WARNING);
      } else {
        var response = Api().postHttpLogin(
            url: 'https://smartautokw.com/api/AccountApi/LoginSysUser',
            data: {"username": email, "Password": password});
        response
            .then((value) async => {
                  selectedGender == true
                      ? {
                          CacheHelper.putString(
                              SharedKeys.token, value['access_token']),
                          token = CacheHelper.getString(SharedKeys.token),
                        }
                      : {
                          token = '',
                          token = CacheHelper.putString(SharedKeys.token, ''),
                        },
                  MagicRouter.navigateAndPopAll(const HomeView()),
                  emit(SignInSuccess(register: value)),
                  showToast(
                      msg: 'تم تسجيل الدخول بنجاح'.tr(),
                      state: ToastedStates.SUCCESS),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(SignInFailed(error: error.toString())),
                });
      }
    });
  }

  logout(context) async {
    emit(LogoutLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(NetworkFailed("Check your internet connection and try again"));
        showToast(
            msg: 'Check your internet connection and try again'.tr(),
            state: ToastedStates.WARNING);
      } else {
        var response = Api().deleteHttp(url: 'sign-out', authToken: token);
        response
            .then((value) async => {
                  MagicRouter.navigateAndPopAll(const SmartAutoLoginScreen()),
                  emit(LogoutSuccess()),
                  showToast(
                      msg: 'Logout Successfully'.tr(),
                      state: ToastedStates.SUCCESS),
                  token = '',
                  token = CacheHelper.putString(SharedKeys.token, ''),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(LogoutFailed(error.toString())),
                });
      }
    });
  }

  static final LocalAuthentication auth = LocalAuthentication();

  Future<bool> canAuthenticate() async {
    try {
      return await auth.canCheckBiometrics;
    } catch (e) {
      return false;
    }
  }

  int _authCode = 0; //  0 fron nothing   1 for finget   2 for  face
  int get getAuthCode => _authCode;

  List<BiometricType>? _availableBiometrics;
  List<BiometricType>? get getAvailableBiometricsList => _availableBiometrics;
  getAvailableBiometrics() async {
    emit(GetAvailableBioLoadingState(isLoading: true));
    try {
      _availableBiometrics = await auth.getAvailableBiometrics();

      if (_availableBiometrics != null) {
        if (_availableBiometrics!.contains(BiometricType.face)) {
          _authCode = 2;
        } else if (_availableBiometrics!.contains(BiometricType.fingerprint)) {
          _authCode = 1;
        } else {
          _authCode = 0;
        }
      }
    } on PlatformException catch (e) {
      _availableBiometrics = <BiometricType>[];
      debugPrint(e.message);
    }
    emit(GetAvailableBioLoadingState(isLoading: false));
  }

  Future<bool> authenticate() async {
    bool available = await canAuthenticate();
    if (!available) {
      return false;
    }

    try {
      return await auth.authenticate(
        localizedReason: 'يُرجى المصادقة لتسجيل الدخول إلى Smart Auto'.tr(),
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.message);

      return false;
    }
  }
}
