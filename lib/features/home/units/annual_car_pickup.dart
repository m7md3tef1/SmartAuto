part of '../view.dart';

customRow3(text, hint, isSearch, context) {
  return Padding(
      padding: const EdgeInsets.only(top: 2.0, bottom: 2, left: 8, right: 8),
      child: text == 'الحالة: '.tr()
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150.w,
                  child: CustomText(
                      align: TextAlign.end,
                      text: 'الحالة: '.tr(),
                      line: 2,
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5.w),
                SizedBox(
                    width: 200.w,
                    child: DropdownButtonFormField(
                      padding: EdgeInsets.zero,
                      hint: CustomText(
                        text: '',
                        color: Colors.grey,
                        fontSize: 18.sp,
                      ),
                      focusColor: Colors.white,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        focusColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide:
                                const BorderSide(color: Colors.black54)),
                        disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide:
                                const BorderSide(color: Colors.black54)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide:
                                const BorderSide(color: Colors.black54)),
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 1.h),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.r),
                            borderSide:
                                BorderSide(color: Colors.red, width: 1.w)),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil().orientation ==
                                    Orientation.landscape
                                ? 7.sp
                                : 15.sp,
                            color: Colors.black),
                      ),
                      isExpanded: true,
                      iconSize: 25.w,
                      itemHeight: 50,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem(
                            enabled: false, value: '', child: SizedBox()),
                      ],
                      onChanged: (val) {},
                    ))
              ],
            )
          : text == 'من تاريخ: '.tr()
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: CustomText(
                                align: TextAlign.start,
                                text: 'من تاريخ: '.tr(),
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: EasyLocalization.of(
                                            navigatorKey.currentContext!)!
                                        .currentLocale ==
                                    const Locale('en', '')
                                ? 80.w
                                : 100.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontFamily: 'tj',
                                      color: Colors.red,
                                      fontSize: ScreenUtil().orientation ==
                                              Orientation.landscape
                                          ? 10.sp
                                          : 12.sp),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      0.0, 12.0, 0.0, 0.0),
                                  hintText: '',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                          color: Colors.black54)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide(
                                          color: Colors.black54,
                                          width: .1.w,
                                          style: BorderStyle.solid)),
                                  suffixIconColor: Colors.black),
                            ),
                          )
                        ],
                      )),
                      Expanded(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: CustomText(
                                align: TextAlign.start,
                                text: 'من وقت: '.tr(),
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: EasyLocalization.of(
                                            navigatorKey.currentContext!)!
                                        .currentLocale ==
                                    const Locale('en', '')
                                ? 80.w
                                : 100.w,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(
                                      fontFamily: 'tj',
                                      color: Colors.red,
                                      fontSize: ScreenUtil().orientation ==
                                              Orientation.landscape
                                          ? 10.sp
                                          : 12.sp),
                                  contentPadding: const EdgeInsets.fromLTRB(
                                      0.0, 12.0, 0.0, 0.0),
                                  hintText: '',
                                  hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700),
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                          color: Colors.black54)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: BorderSide(
                                          color: Colors.black54,
                                          width: .1.w,
                                          style: BorderStyle.solid)),
                                  suffixIconColor: Colors.black),
                            ),
                          )
                        ],
                      ))
                    ])
              : isSearch == 'Column'
                  ? Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: CustomText(
                                  align: TextAlign.end,
                                  text: text,
                                  line: 2,
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 5.w),
                            Row(
                              children: [
                                SizedBox(
                                  width: 150.w,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        errorStyle: TextStyle(
                                            fontFamily: 'tj',
                                            color: Colors.red,
                                            fontSize:
                                                ScreenUtil().orientation ==
                                                        Orientation.landscape
                                                    ? 10.sp
                                                    : 12.sp),
                                        contentPadding:
                                            const EdgeInsets.fromLTRB(
                                                0.0, 12.0, 0.0, 0.0),
                                        hintText:
                                            // text == 'رقم اللوحة: '.tr()
                                            //     ? getPlates['cuntr_no'] :
                                            '',
                                        hintStyle: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            borderSide: const BorderSide(
                                                color: Colors.black54)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            borderSide: BorderSide(
                                                color: Colors.black54,
                                                width: .1.w,
                                                style: BorderStyle.solid)),
                                        suffixIconColor: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                isSearch == null
                                    ? const SizedBox()
                                    : InkWell(
                                        onTap: () => customDialogShowUsers(
                                            context, text),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.yellow,
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(8.r)),
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.h,
                                                  horizontal: 5.w),
                                              child: const Icon(Icons.search,
                                                  color: Colors.black)),
                                        ),
                                      )
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 205.w,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        fontFamily: 'tj',
                                        color: Colors.red,
                                        fontSize: ScreenUtil().orientation ==
                                                Orientation.landscape
                                            ? 10.sp
                                            : 12.sp),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        0.0, 0.0, 0.0, 0.0),
                                    hintText:
                                        // text == 'رقم اللوحة: '.tr()
                                        //     ? getPlates['cuntr_no'] :
                                        '',
                                    hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(
                                            color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Colors.black54,
                                            width: .1.w,
                                            style: BorderStyle.solid)),
                                    suffixIconColor: Colors.black),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: CustomText(
                              align: TextAlign.end,
                              text: text,
                              line: 2,
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.w),
                        Row(
                          children: [
                            SizedBox(
                              width: 150.w,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        fontFamily: 'tj',
                                        color: Colors.red,
                                        fontSize: ScreenUtil().orientation ==
                                                Orientation.landscape
                                            ? 10.sp
                                            : 12.sp),
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        0.0, 12.0, 0.0, 0.0),
                                    hintText: '',
                                    hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: const BorderSide(
                                            color: Colors.black54)),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        borderSide: BorderSide(
                                            color: Colors.black54,
                                            width: .1.w,
                                            style: BorderStyle.solid)),
                                    suffixIconColor: Colors.black),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            isSearch == null
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () =>
                                        customDialogShowUsers(context, text),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  8.r)),
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5.h, horizontal: 5.w),
                                          child: const Icon(Icons.search,
                                              color: Colors.black)),
                                    ),
                                  )
                          ],
                        )
                      ],
                    ));
}

// ignore: must_be_immutable
class AnnualPickupCar extends StatelessWidget {
  AnnualPickupCar(this.nameCar, this.nameButton, {super.key});
  var nameCar;
  var nameButton;
  @override
  Widget build(BuildContext context) {
    List name = [
      'رقم الحركة: '.tr(),
      'تاريخ الحركة: '.tr(),
      'الحالة: '.tr(),
      'رقم اللوحة: '.tr(),
      'من مركز التلكفة: '.tr(),
      'الى مركز التلكفة: '.tr(),
      'من مكان: '.tr(),
      'الى مكان: '.tr(),
      'قراءة العداد السابقة: '.tr(),
      'قراءة العداد الحالية: '.tr(),
      'من تاريخ: '.tr(),
      'العميل: '.tr(),
      'رقم العقد: '.tr(),
      'مستخدم السيارة: '.tr(),
      'ملاحظات: '.tr(),
      'تاريخ الاستراجع المتوقع: '.tr(),
      'أيام التأخير: '.tr(),
    ];
    List<Widget> items = List.generate(
      name.length,
      (index) {
        return customRow3(
            name[index],
            '',
            index == 0 ||
                    index == 1 ||
                    index == 2 ||
                    index == 8 ||
                    index == 9 ||
                    index == 14 ||
                    index == 15 ||
                    index == 16
                ? null
                : 'Column',
            context);
      },
    );
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 0,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.yellow)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarHome(
            icon: InkWell(
                onTap: () {
                  MagicRouter.pop();
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.black)),
            text: CustomText(
                text: nameCar,
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListView.builder(
                        itemBuilder: (context, index) =>
                            Center(child: items[index]),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: name.length,
                        scrollDirection: Axis.vertical),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20.r),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 12.w),
                                  child: CustomText(
                                      text: 'تفريغ البيانات'.tr(),
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadiusDirectional.circular(20.r),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 12.w),
                                  child: CustomText(
                                      text: 'حفظ'.tr(),
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
