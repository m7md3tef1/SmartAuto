part of '../view.dart';

customRow1(text, hint, isSearch,context, {no}) {
  return Padding(
      padding: EdgeInsets.only(
          top: isSearch == 'column' ? 6 : 3.0,
          bottom: no == false ? 0 : 3,
          left: 8,
          right: 8),
      child: text == 'من تاريخ: '.tr()
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
                      width:EasyLocalization.of(
                          navigatorKey
                              .currentContext!)!
                          .currentLocale ==
                          const Locale('en', '')
                          ?80.w: 100.w,
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
                      width:EasyLocalization.of(
                          navigatorKey
                              .currentContext!)!
                          .currentLocale ==
                          const Locale('en', '')
                          ?80.w: 100.w,
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
          : text == 'مكان المفتاح: '.tr() ||
                  text == 'مكان مستلم المفتاح الاحتياطى: '.tr()
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
                                    onTap: () => customDialogShowUsers(context,text),
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
                                  ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
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
                    )
                  ],
                )
              : isSearch == 'column'
                  ? Row(
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
                              onTap: () => customDialogShowUsers(context,text),
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
class AnnualDeliveringCar extends StatelessWidget {
  AnnualDeliveringCar(this.nameCar, this.nameButton, {super.key});
  var nameCar;
  var nameButton;
  @override
  Widget build(BuildContext context) {
    List name = [
      'رقم الحركة: '.tr(),
      'تاريخ الحركة: '.tr(),
      'أمر التسليم: '.tr(),
      'رقم اللوحة: '.tr(),
      'وصف اللوحة: '.tr(),
      'من مركز التلكفة: '.tr(),
      'وصف مركز التلكفة: '.tr(),
      'الى مركز التلكفة: '.tr(),
      'وصف مركز التلكفة: '.tr(),
      'من مكان: '.tr(),
      'الى مكان: '.tr(),
      'قراءة العداد السابقة: '.tr(),
      'قراءة العداد الحالية: '.tr(),
      'من تاريخ: '.tr(),
      /*'من وقت: '.tr().tr()*/
      'العميل: '.tr(),
      'وصف العميل: '.tr(),
      'رقم العقد: '.tr(),
      'وصف العقد: '.tr(),
      'مستخدم السيارة: '.tr(),
      'وصف مستخدم السيارة: '.tr(),
      'الموظف: '.tr(),
      'اسم الموظف: '.tr(),
      'ملاحظات: '.tr(),
      'مستلم المفتاح: '.tr(),
      'اسم مستلم المفتاح: '.tr(),
      'مكان المفتاح: '.tr(),
      'الحركة الأخرى: '.tr(),
      'مستلم المفتاح الاحتياطى: '.tr(),
      'اسم مستلم المفتاح الاحتياطى: '.tr(),
      'مكان مستلم المفتاح الاحتياطى: '.tr(),
      'تاريخ الاسترجاع المتوقع: '.tr(),
    ];
    List<Widget> items = List.generate(
      name.length,
      (index) {
        return customRow1(
            name[index],
            '',
            no: index + 1 == 4 ||
                    index + 1 == 6 ||
                    index + 1 == 8 ||
                    index + 1 == 10 ||
                    index + 1 == 15 ||
                    index + 1 == 17 ||
                    index + 1 == 19 ||
                    index + 1 == 21 ||
                    index + 1 == 24
                ? false
                : true,
            index == 0 ||
                    index == 1 ||
                    index == 2 ||
                    index == 11 ||
                    index == 12 ||
                    index == 13 ||
                    index == 22 ||
                    index == 26 ||
                    index == 30
                ? null
                : index == 4 ||
                        index == 6 ||
                        index == 8 ||
                        index == 15 ||
                        index == 17 ||
                        index == 19 ||
                        index == 28 ||
                        index == 21 ||
                        index == 24
                    ? 'column'
                    : 'dd',context);
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
