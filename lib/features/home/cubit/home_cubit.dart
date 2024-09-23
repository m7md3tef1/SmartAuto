import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smartauto/core/dialoges/toast.dart';

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
                emit(GetPlaceSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetPlaceFailed()),
              });
    }
    // });
  }

  var GetListContract;
  getListContract() async {
    emit(GetContractLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url:
              // EasyLocalization.of(navigatorKey.currentContext!)!
              //             .currentLocale ==
              //         const Locale('ar', '') ?
              'https://smartautokw.com/api/eRP_Prjcts/GetListof_ContractAR'
          // : 'https://smartautokw.com/api/eRP_Prjcts/GetListof_ContractAR'
          );
      response
          .then((value) async => {
                GetListContract = value,
                emit(GetContractSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetContractFailed()),
              });
    }
    // });
  }

  var GetListCustomer;
  getListCustomer() async {
    emit(GetCustomerLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url:
              // EasyLocalization.of(navigatorKey.currentContext!)!
              //             .currentLocale ==
              //         const Locale('ar', '') ?
              'https://smartautokw.com/api/eRP_PrjCust/GetListof_CustomerAR'
          // : 'https://smartautokw.com/api/eRP_Codes/GetListof_CustomerEN'
          );
      response
          .then((value) async => {
                GetListCustomer = value,
                emit(GetCustomerSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetCustomerFailed()),
              });
    }
    // });
  }

  var GetListEmployee;
  getListEmployee() async {
    emit(GetEmployeeLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url:
              // EasyLocalization.of(navigatorKey.currentContext!)!
              //             .currentLocale ==
              //         const Locale('ar', '') ?
              'https://smartautokw.com/api/eRP_Emps/GetListof_EmployeeAR'
          // : 'https://smartautokw.com/api/eRP_Codes/GetListof_EmployeeEN'
          );
      response
          .then((value) async => {
                GetListEmployee = value,
                emit(GetEmployeeSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetEmployeeFailed()),
              });
    }
    // });
  }

  var GetMaxKey;
  getMaxKey(id) async {
    emit(GetMaxKeyLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      var response = Api().getHttp(
          url: 'https://smartautokw.com/api/eRP_CarsTRH/GetMaxKey/$id');
      response
          .then((value) async => {
                GetMaxKey = value['Max'],
                emit(GetMaxKeySuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                emit(GetMaxKeyFailed()),
              });
    }
    // });
  }

/*

{
         public short Trans_ty { get; set; } // نوع الحركة
         public int Trans_no { get; set; }  // رقم الحركة
         public DateTime? Trans_dt { get; set; } // تاريخ الحركة
         public int? Prv_Cntr { get; set; } // قراءة العداد السابقة
         public int? Cur_Cntr { get; set; } // قراءة العداد الحالية
         public string In_Prj_no { get; set; } // رقم العقد
         public string Cust_no { get; set; } // العميل
         public DateTime? Out_dt { get; set; } // تاريخ خروج السيارة
         public DateTime? Out_tm { get; set; } // وقت الخروج
         public string Out_Notes { get; set; } // ملاحظات الخروج
         public string RcEmp_Code { get; set; } // السائق
         public string OEmp_Code { get; set; } // الموظف
}

 */
  add(transTy, transDt, prvCntr, curCntr, inPrjNo, custNo, outDt, outTm,
      outNotes, rcempCode, oempCode, plateNo, context) async {
    emit(AddCarRentLoading());
    // connectivity.checkConnectivity().then((value) async {
    //   if (ConnectivityResult.none == value) {
    //   } else
    {
      showDialog(
          barrierDismissible: false,
          useRootNavigator: false,
          context: context,
          builder: (_) {
            return Dialog(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                insetPadding: EdgeInsets.symmetric(horizontal: 100.w),
                shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.transparent)),
                child: const SpinKitCircle(color: Colors.yellow, size: 70.0));
          });
      var data = {
        "Trans_ty": int.parse(transTy.toString()) ?? '',
        "Trans_dt": transDt ?? '',
        "Prv_Cntr": prvCntr ?? '',
        "Cur_Cntr": curCntr ?? '',
        "In_Prj_no": inPrjNo ?? '',
        "Cust_no": custNo ?? '',
        "Out_dt": outDt ?? '',
        "Out_tm": outTm ?? '',
        "Out_Notes": outNotes ?? '',
        "RcEmp_Code": rcempCode ?? '',
        "OEmp_Code": oempCode ?? '',
        "Plate_no": plateNo ?? ''
      };
      print(data);
      var response = Api().postHttp(
          url: 'https://smartautokw.com/api/carRent/addCarRent', data: data);
      response
          .then((value) async => {
                print(value),
                showToast(
                    msg: 'تم الحفظ بنجاح'.tr(), state: ToastedStates.SUCCESS),
                MagicRouter.pop(),
                MagicRouter.pop(),
                emit(AddCarRentSuccess()),
              })
          .onError((error, stackTrace) => {
                print(error),
                MagicRouter.pop(),
                emit(AddCarRentFailed()),
              });
    }
    // });
  }
}
