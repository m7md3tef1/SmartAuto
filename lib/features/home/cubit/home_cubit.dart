import 'dart:ui';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';
import '../../../core/router/router.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  var getPlates;
  var GetListPlate;
  getListPlate() async {
    emit(GetPlateLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api()
          .getHttp(url: 'https://smartautokw.com/api/eRP_FA/GetListof_PlateEN');
      response
          .then((value) async => {
                GetListPlate = value,
                emit(GetPlateSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetPlateFailed()),
              });
    }
    // });
  }

  var GetListCost;
  getListCost() async {
    emit(GetCostLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url: EasyLocalization.of(navigatorKey.currentContext!)!
                      .currentLocale ==
                  const Locale('ar', '')
              ? 'https://smartautokw.com/api/eRP_Costs/GetListof_CostAR'
              : 'https://smartautokw.com/api/eRP_Costs/GetListof_CostEN');
      response
          .then((value) async => {
                GetListCost = value,
                emit(GetCostSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetCostFailed()),
              });
    }
    // });
  }

  var GetListPlace;
  getListPlace() async {
    emit(GetPlaceLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url: EasyLocalization.of(navigatorKey.currentContext!)!
                      .currentLocale ==
                  const Locale('ar', '')
              ? 'https://smartautokw.com/api/eRP_Codes/GetListof_PlaceAR'
              : 'https://smartautokw.com/api/eRP_Codes/GetListof_PlaceEN');
      response
          .then((value) async => {
                GetListPlace = value,
                print(GetListPlace),
                emit(GetPlaceSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetPlaceFailed()),
              });
    }
    // });
  }
}
