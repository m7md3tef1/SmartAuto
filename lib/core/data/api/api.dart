import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../const/utils.dart';
import '../../dialoges/toast.dart';
import '../../keys/keys.dart';
import '../../router/router.dart';
import '../local/cacheHelper.dart';

class Api {
  String baseUrl = 'https://smartautokw.com/api/';
  Future getHttp({authToken, url}) async {
    try {
      var response = await Dio().get(url,
          options: Options(
            headers: {
              "Content-Type": 'application/json',
            },
          ));
      if (response.statusCode == 200) {
        var productsList = response.data;
        return productsList;
      } else {
        return '';
      }
    } on DioError catch (e) {
      print('eeeeeeeeeeeee== ' + e.response!.data['message']);
      if (e.response!.data['message'].toString() == 'You Are Not Authorized') {
        token = '';
        token = CacheHelper.putString(SharedKeys.token, '');
      }
      if (e.response!.statusCode == 401) {
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future getDataHttp({authToken, url}) async {
    try {
      var response = await Dio().get(baseUrl + url,
          options: Options(
            headers: {
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));
      if (response.statusCode == 200) {
        var productsList = response.data;
        return productsList;
      } else {
        return '';
      }
    } on DioError catch (e) {
      if (e.response!.data['message'].toString() == 'You Are Not Authorized') {
        token = '';
        token = CacheHelper.putString(SharedKeys.token, '');
      }
      if (e.response!.statusCode == 401) {
      } else {
        throw Exception(e.response!.data);
      }
    }
  }

  Future<dynamic> postHttpLogin(
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$url',data: data
          // options: Options(
          //   headers: {
          //     "Content-Type": 'application/json',
          //   },
          // )
      );
print(response.data);
      if (response.statusCode == 200) {
        CacheHelper.putBool(SharedKeys.isLogin, true);
        return response.data;
      }
    } on DioError catch (e) {
      showToast(
          msg: 'Email Or Password Is Not True'.tr(),
          state: ToastedStates.WARNING);

      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postHttp({required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post(url,
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              "Content-Type": 'application/json',
            },
          ));
      print(response.statusCode);
      if (response.statusCode == 200||response.statusCode == 201) {
        return response;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {}
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postDataHttp(
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {}
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postHttp1({required url, authToken}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          options: Options(
            headers: {
              "Authorization": 'Bearer $authToken',
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postHttp2(
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              'Accept': 'application/json',
              "Authorization": 'Bearer $authToken',
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {}
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postHttp4(
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$url',
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              'Accept': 'application/json',
              "Authorization": 'Bearer $authToken',
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));

      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {}
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> postHttp3(
      {required url, data, authToken, queryParams}) async {
    try {
      var response = await Dio().post('$baseUrl$url',
          data: data,
          queryParameters: queryParams,
          options: Options(
            headers: {
              'Accept': 'application/json',
              "Authorization": 'Bearer $authToken',
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      }
    } on DioError catch (e) {
      var error = e.response!.data['errors']
          .toString()
          .replaceAll('{password:', '')
          .replaceAll('[', '')
          .replaceAll(']}', '')
          .replaceAll('{username:', '')
          .replaceAll('{email:', '');
      showToast(msg: error.tr(), state: ToastedStates.SUCCESS);
      throw Exception(e.response!.data);
    }
  }

  Future<dynamic> putHttp({required url, required data, authToken}) async {
    try {
      var response = await Dio().patch('$baseUrl$url',
          data: data,
          options: Options(headers: {
            "Authorization": 'Bearer $authToken',
            "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                        .currentLocale ==
                    const Locale('ar', '')
                ? 'ar'
                : "en"
          }));
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {}
  }

  Future<dynamic> deleteHttp({required url, data, authToken}) async {
    try {
      var response = await Dio().delete(baseUrl + url,
          data: data,
          options: Options(
            headers: {
              'Accept': 'application/json',
              "Authorization": 'Bearer $authToken',
              "lang": EasyLocalization.of(navigatorKey.currentContext!)!
                          .currentLocale ==
                      const Locale('ar', '')
                  ? 'ar'
                  : "en"
            },
          ));
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {}
  }
}

String baseUrl = 'https://self-labsite.zauzat.com/api/';
