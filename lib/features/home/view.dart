import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartauto/core/dialoges/toast.dart';
import 'package:smartauto/core/router/router.dart';
import 'package:smartauto/core/widgets/custom_text.dart';
import 'package:smartauto/features/auth/login/login.dart';
import 'package:smartauto/features/home/cubit/home_cubit.dart';

import '../../core/const/utils.dart';
import '../../core/data/local/cacheHelper.dart';
import '../../core/keys/keys.dart';

part 'units/annual_car_delivery.dart';
part 'units/annual_car_pickup.dart';
part 'units/app_bar.dart';
part 'units/daily_car_delivery.dart';
part 'units/daily_car_pickup.dart';
part 'units/listview_home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    HomeCubit.get(context).getListPlate();
    HomeCubit.get(context).getListCost();
    HomeCubit.get(context).getListPlace();
    HomeCubit.get(context).getListCustomer();
    HomeCubit.get(context).getListEmployee();
    HomeCubit.get(context).getListContract();
    HomeCubit.get(context).getListKeyPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.yellow)),
      body: Column(
        children: [AppBarHome(), const Expanded(child: ListViewHome())],
      ),
    );
  }
}
