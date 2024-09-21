part of '../view.dart';

// ignore: must_be_immutable
class AppBarHome extends StatelessWidget {
  AppBarHome({this.icon, this.text, this.mainAxisAlignment, super.key});
  var icon;
  var text;
  var mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Padding(
        padding:
            REdgeInsetsDirectional.only(start: 8.w, end: 8.w, bottom: 10.h),
        child: Row(
          mainAxisAlignment:
              mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
          children: [
            icon ??
                CustomText(
                    text: 'الصفحة الرئيسية'.tr(),
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
            icon != null ? SizedBox(width: 20.w) : const SizedBox(),
            text ??
                InkWell(
                    onTap: () {
                      CacheHelper.putBool(SharedKeys.isLogin, false);
                      CacheHelper.putString(SharedKeys.token, '');
                      token = CacheHelper.getString(SharedKeys.token);
                      isLogin = CacheHelper.getBool(SharedKeys.isLogin);
                      MagicRouter.navigateAndPopAll(
                          const SmartAutoLoginScreen());
                    },
                    child: const Icon(Icons.logout)),
          ],
        ),
      ),
    );
  }
}

//
// var getPlate = ;
customDialogShowUsers(context, text) {
  showDialog(
      useRootNavigator: false,
      context: context,
      builder: (dialogContext) {
        // getPlate = null;
        // getPlate = '';
        return SizedBox(
          height: 500.h,
          width: 1.sw,
          child: AlertDialog(
              titlePadding: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
              contentPadding: EdgeInsets.only(left: 0.w, right: 0.w, top: 10.h),
              insetPadding:
                  EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              actionsPadding:
                  EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              backgroundColor: const Color(0xFFFAFAFA),
              surfaceTintColor: Colors.grey,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: const Color(0xFFD6CECE), width: 1.w),
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: 'نافذه استعلاميه عن الموظفين'.tr(),
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ScreenUtil().orientation == Orientation.landscape
                              ? 8.sp
                              : 23.sp,
                      color: Colors.black),
                  InkWell(
                      onTap: () {
                        MagicRouter.pop();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.red),
                          child: Icon(Icons.close,
                              color: Colors.white, size: 20.w)))
                ],
              ),
              content: SizedBox(
                height: .5.sh,
                width: 1.sw,
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: 4.w, end: 4.w, bottom: 5.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadiusDirectional.circular(5.r)),
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 2.w, end: 2.w, bottom: 5.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                      text: text == 'رقم اللوحة: '.tr()
                                          ? "رقم اللوحة".tr()
                                          : 'كود الموظف'.tr(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().orientation ==
                                              Orientation.landscape
                                          ? 8.sp
                                          : 13.sp,
                                      color: Colors.black),
                                  CustomText(
                                      text: text == 'رقم اللوحة: '.tr()
                                          ? "الوصف".tr()
                                          : 'اسم الموظف'.tr(),
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil().orientation ==
                                              Orientation.landscape
                                          ? 8.sp
                                          : 13.sp,
                                      color: Colors.black),
                                  text == 'رقم اللوحة: '.tr()
                                      ? const SizedBox()
                                      : CustomText(
                                          text: 'رقم التليفون'.tr(),
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().orientation ==
                                                  Orientation.landscape
                                              ? 8.sp
                                              : 13.sp,
                                          color: Colors.black)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount:
                                  // text == 'رقم اللوحة: '.tr()
                                  // ? HomeCubit.get(context).getPlate.length:
                                  text == 'رقم اللوحة: '.tr()
                                      ? HomeCubit.get(context)
                                          .GetListPlateEN!
                                          .length
                                      : 3,
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    // text == 'رقم اللوحة: '.tr()
                                    //     ? (getPlate =
                                    //         HomeCubit.get(context).getPlate)
                                    //     :
                                    text == 'رقم اللوحة: '.tr()
                                        ? {
                                            setState(() {
                                              HomeCubit.get(context)
                                                      .getPlates ==
                                                  HomeCubit.get(context)
                                                      .GetListPlateEN[index];
                                              HomeCubit.get(context).getPlates =
                                                  HomeCubit.get(context)
                                                      .GetListPlateEN[index];
                                              print(HomeCubit.get(context)
                                                  .getPlates);
                                              MagicRouter.pop();
                                            }),
                                          }
                                        : '';
                                  },
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 5.w, end: 5.w, bottom: 5.h),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                            text: text == 'رقم اللوحة: '.tr()
                                                ? HomeCubit.get(context)
                                                        .GetListPlateEN[index]
                                                    ['Plate_No']
                                                : '123',
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 6.sp
                                                    : 13.sp,
                                            color: Colors.black),
                                        CustomText(
                                            text: text == 'رقم اللوحة: '.tr()
                                                ? HomeCubit.get(context)
                                                    .GetListPlateEN[index]
                                                        ['fa_DSC_En']
                                                    .toString()
                                                : 'محمد عاطف',
                                            fontWeight: FontWeight.w600,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 6.sp
                                                    : 13.sp,
                                            color: Colors.black),
                                        text == 'رقم اللوحة: '.tr()
                                            ? const SizedBox()
                                            : CustomText(
                                                text: '01021424949',
                                                fontWeight: FontWeight.w600,
                                                fontSize: ScreenUtil()
                                                            .orientation ==
                                                        Orientation.landscape
                                                    ? 6.sp
                                                    : 13.sp,
                                                color: Colors.black)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )),
        );
      });
}
