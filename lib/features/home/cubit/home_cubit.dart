import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  var getPlates;
  var GetListPlateEN;
  getListPlateEN() async {
    emit(GetPlateLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api()
          .getHttp(url: 'https://smartautokw.com/api/eRP_FA/GetListof_PlateEN');
      response
          .then((value) async => {
                GetListPlateEN = value,
                emit(GetPlateSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetPlateFailed()),
              });
    }
    // });
  }

  var GetListCostAR;
  getListCostAR() async {
    emit(GetCostLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url: 'https://smartautokw.com/api/eRP_Costs/GetListof_CostAR');
      response
          .then((value) async => {
                GetListCostAR = value,
                emit(GetCostSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetCostFailed()),
              });
    }
    // });
  }
}
