import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'connect_state.dart';

class CheckConnectCubit extends Cubit<CheckConnectionState> {
  CheckConnectCubit() : super(LoadingConnection());
  final connectivity = Connectivity();
  bool? hasConnected;

  initialConnection() async {
    connectivity.onConnectivityChanged.listen(connectChange);
  }

  void connectChange(ConnectivityResult result) {
    checkConnection(result);
  }

  Future<bool?> checkConnection(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      hasConnected = false;
      emit(DisConnect());
    } else {
      hasConnected = true;
      emit(Connect());
    }
    return null;
  }
}
