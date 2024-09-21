part of '../cubit/auth_cubit.dart';

abstract class SmartAutoLoginStates {}

class LoginInitial extends SmartAutoLoginStates {}

class SelfLabChangePasswordVisibilityState extends SmartAutoLoginStates {}

class NetworkFailed extends SmartAutoLoginStates {
  final String msg;
  NetworkFailed(this.msg);
}

class GetAvailableBioLoadingState extends SmartAutoLoginStates {
  final bool isLoading;
  GetAvailableBioLoadingState({required this.isLoading});
}

//sign_in
class SignInLoading extends SmartAutoLoginStates {}

class SignInSuccess extends SmartAutoLoginStates {
  var register;
  SignInSuccess({this.register});
}

class SignInFailed extends SmartAutoLoginStates {
  String? error;
  SignInFailed({this.error});
}

//logout
class LogoutLoading extends SmartAutoLoginStates {}

class LogoutSuccess extends SmartAutoLoginStates {
  LogoutSuccess();
}

class LogoutFailed extends SmartAutoLoginStates {
  var error;
  LogoutFailed(this.error);
}
