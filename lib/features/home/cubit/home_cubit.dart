import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  // var getPlates;
  // getPlate() async {
  //   emit(GetPlateLoading());
  //   connectivity.checkConnectivity().then((value) async {
  //     if (ConnectivityResult.none == value) {
  //     } else {
  //       var response = Api()
  //           .getHttp(url: 'https://smartautokw.com/api/carRent/getPlateList');
  //       response
  //           .then((value) async => {
  //                 print(value),
  //                 getPlates = value,
  //                 emit(GetPlateSuccess()),
  //               })
  //           .onError((error, stackTrace) => {
  //                 print(error),
  //                 emit(GetPlateFailed()),
  //               });
  //     }
  //   });
  // }

  var getContractLists;
  getContractList() async {
    emit(GetContractLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
      } else {
        var response = Api().getHttp(
            url: 'https://smartautokw.com/api/carRent/getContractList/1');
        response
            .then((value) async => {
                  print(value),
                  getContractLists = value,
                  emit(GetContractSuccess()),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(GetContractFailed()),
                });
      }
    });
  }

  var getPlates;
  var GetListPlateEN;
  getListPlateEN() async {
    emit(GetPlateLoading());
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
      } else {
        var response = Api().getHttp(
            url: 'https://smartautokw.com/api/eRP_FA/GetListof_PlateEN');
        response
            .then((value) async => {
                  print(value),
                  GetListPlateEN = value,
                  print(GetListPlateEN[0]['fa_DSC_En']),
                  print(GetListPlateEN.length),
                  emit(GetPlateSuccess()),
                })
            .onError((error, stackTrace) => {
                  print(error),
                  emit(GetPlateFailed()),
                });
      }
    });
  }
}
