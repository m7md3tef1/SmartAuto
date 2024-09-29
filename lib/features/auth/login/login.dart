import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartauto/core/router/router.dart';
import 'package:smartauto/core/widgets/custom_text.dart';
import 'package:smartauto/features/home/view.dart';

import '../../../core/const/utils.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import '../../../core/widgets/customtextform2.dart';
import 'cubit/auth_cubit.dart';

Widget customContainer(
    {widget, context, int? currentIndex = 0, text, asset, index}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
          padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w),
          child: InkWell(
              onTap: () {},
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 5.w, end: 5.w),
                            child: SvgPicture.asset(asset,
                                height: ScreenUtil().orientation ==
                                        Orientation.landscape
                                    ? 20.h
                                    : 20.h,
                                width: ScreenUtil().orientation ==
                                        Orientation.landscape
                                    ? 20.w
                                    : 20.w,
                                color: Colors.black)),
                        widget
                      ])))),
    ],
  );
}

class SmartAutoLoginScreen extends StatefulWidget {
  const SmartAutoLoginScreen({super.key});
  @override
  State<SmartAutoLoginScreen> createState() => _SmartAutoLoginScreenState();
}

class _SmartAutoLoginScreenState extends State<SmartAutoLoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var items = [
    'English',
    'عربى',
  ];
  String? dropDownValue;
  @override
  void initState() {
    context.read<SmartAutoLoginCubit>().getAvailableBiometrics();
    super.initState();
  }

  bool? selectedGender = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SmartAutoLoginCubit, SmartAutoLoginStates>(
        listener: (context, state) {
      if (state is SignInSuccess) {}
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.yellow),
        ),
        backgroundColor: Colors.yellow,
        body: SingleChildScrollView(
          child: Column(
            children: [
              customContainer(
                  text: ' ',
                  index: 12,
                  asset: 'assets/images/language.svg',
                  context: context,
                  widget: Container(
                      height: ScreenUtil().orientation == Orientation.landscape
                          ? 40.h
                          : 33.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5.r),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1.w)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: DropdownButton(
                              hint: Row(
                                children: [
                                  SvgPicture.asset(EasyLocalization.of(
                                                  navigatorKey.currentContext!)!
                                              .currentLocale ==
                                          const Locale('en', '')
                                      ? 'assets/images/english.svg'
                                      : 'assets/images/arabic.svg'),
                                  SizedBox(width: 5.w),
                                  Text(EasyLocalization.of(
                                                  navigatorKey.currentContext!)!
                                              .currentLocale ==
                                          const Locale('ar', '')
                                      ? 'عربى'
                                      : 'English'),
                                ],
                              ),
                              style: TextStyle(
                                  fontFamily: 'tj',
                                  color: const Color(0xFF777E90),
                                  fontSize: ScreenUtil().orientation ==
                                          Orientation.landscape
                                      ? 10.sp
                                      : 13.sp,
                                  fontWeight: FontWeight.w700),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.arrow_drop_down),
                              isExpanded: true,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                    value: items,
                                    child: InkWell(
                                        onTap: () {
                                          items.toString() == 'عربى'
                                              ? {
                                                  EasyLocalization.of(context)!
                                                      .setLocale(const Locale(
                                                          'ar', '')),
                                                  MagicRouter.pop(),
                                                }
                                              : {
                                                  EasyLocalization.of(context)!
                                                      .setLocale(const Locale(
                                                          'en', '')),
                                                  MagicRouter.pop(),
                                                };
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(items,
                                                      style: TextStyle(
                                                          fontFamily: 'tj',
                                                          color: const Color(
                                                              0xFF777E90),
                                                          fontSize: ScreenUtil()
                                                                      .orientation ==
                                                                  Orientation
                                                                      .landscape
                                                              ? 10.sp
                                                              : 13.sp,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                  SvgPicture.asset(items
                                                              .toString() ==
                                                          'English'
                                                      ? 'assets/images/english.svg'
                                                      : 'assets/images/arabic.svg'),
                                                ]))));
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                              }))),
                  currentIndex: 4),
              SizedBox(height: 100.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.w),
                        child: Form(
                          key: formKey,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/Logo.png',
                                    height: 100.h,
                                    width: 100.w,
                                    fit: BoxFit.contain),
                                SizedBox(height: 40.h),
                                CustomTextFormField2(
                                    type: TextInputType.emailAddress,
                                    controller: emailController,
                                    title: 'إسم المستخدم'.tr(),
                                    label: '',
                                    auto: AutovalidateMode.onUserInteraction,
                                    TextInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        return '⚠️  ${'Please Enter  UserName'.tr()}';
                                      }
                                      return null;
                                    },
                                    icondata: const Icon(Icons.person,
                                        color: Colors.black),
                                    secure: false),
                                SizedBox(height: 15.h),
                                CustomTextFormField2(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    title: 'كلمة المرور'.tr(),
                                    label: '',
                                    auto: AutovalidateMode.onUserInteraction,
                                    TextInputAction: TextInputAction.done,
                                    validator: (value) {
                                      if (value.toString().isEmpty) {
                                        return '⚠️  ${'Please enter your password'.tr()}';
                                      }
                                      return null;
                                    },
                                    icondata: const Icon(Icons.lock,
                                        color: Colors.black),
                                    suffix: IconButton(
                                        icon: Icon(
                                            SmartAutoLoginCubit.get(context)
                                                .suffix),
                                        onPressed: () {
                                          SmartAutoLoginCubit.get(context)
                                              .changePasswordVisibility();
                                        }),
                                    secure: SmartAutoLoginCubit.get(context)
                                        .isPassword),
                                SizedBox(height: 20.h),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = !selectedGender!;
                                    });
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: 25.w,
                                          padding: EdgeInsetsDirectional.zero,
                                          child: Checkbox(
                                              autofocus: false,
                                              visualDensity:
                                                  VisualDensity.comfortable,
                                              activeColor: Colors.black,
                                              checkColor: Colors.white,
                                              value: selectedGender,
                                              side: BorderSide(
                                                  color: Colors.black,
                                                  width: 2.w),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.r)),
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedGender = value!;
                                                });
                                              })),
                                      SizedBox(width: 5.w),
                                      Padding(
                                        padding: EdgeInsets.only(top: 5.h),
                                        child: CustomText(
                                            text: 'تذكرنى'.tr(),
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 7.sp
                                                    : 15.sp,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BlocConsumer<SmartAutoLoginCubit,
                                        SmartAutoLoginStates>(
                                      listener: (context, state) {},
                                      builder: (context, state) {
                                        return state is SignInLoading
                                            ? Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 35.w),
                                                child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                Colors.black)))
                                            : InkWell(
                                                onTap: () {
                                                  if (formKey.currentState!
                                                      .validate()) {
                                                    SmartAutoLoginCubit.get(
                                                            context)
                                                        .signIn(
                                                            emailController.text
                                                                .trim(),
                                                            passwordController
                                                                .text
                                                                .trim(),
                                                            context,
                                                            selectedGender);
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.yellow,
                                                      borderRadius:
                                                          BorderRadiusDirectional
                                                              .circular(10.r),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 13.h,
                                                            horizontal: 35.w),
                                                    child: CustomText(
                                                        text: 'دخول'.tr(),
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              );
                                      },
                                    ),
                                    SizedBox(height: 20.h),
                                    GestureDetector(
                                      onTap: () async {
                                        bool available =
                                            await SmartAutoLoginCubit.get(
                                                    context)
                                                .canAuthenticate();
                                        if (!available) {
                                          showToast(
                                              msg:
                                                  "This device not supported for bio authentication"
                                                      .tr(),
                                              state: ToastedStates.ERROR);
                                        } else {
                                          bool isAuthenticated =
                                              await SmartAutoLoginCubit.get(
                                                      context)
                                                  .authenticate();
                                          if (isAuthenticated) {
                                            selectedGender == true
                                                ? {
                                                    CacheHelper.putString(
                                                        SharedKeys.token,
                                                        'isAuthenticated'),
                                                    token =
                                                        CacheHelper.getString(
                                                            SharedKeys.token),
                                                  }
                                                : {
                                                    token = '',
                                                    token =
                                                        CacheHelper.putString(
                                                            SharedKeys.token,
                                                            ''),
                                                  };
                                            MagicRouter.navigateTo(
                                                const HomeView());
                                          } else {
                                            showToast(
                                                msg:
                                                    "Something went wrong".tr(),
                                                state: ToastedStates.ERROR);
                                          }
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 4, bottom: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.yellow),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SmartAutoLoginCubit.get(context)
                                                          .getAuthCode ==
                                                      2
                                                  ? Icon(Icons.face,
                                                      size: 45.w,
                                                      color: Colors.black)
                                                  : Icon(Icons.fingerprint,
                                                      size: 45.w,
                                                      color: Colors.black),
                                            ]),
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
