part of '../view.dart';
 var  formKey = GlobalKey<FormState>();
 var plate;
 var employee;
 var contract;
 var customer;
 var place1;
 var place2;
 var date;
 var date1;
 var date2;
 TextEditingController? Notes=TextEditingController();
 TextEditingController? curCntr=TextEditingController();
 TextEditingController? prvCntr=TextEditingController();
 var placeKey;
 var placeKeyReci;
 var time;
 var cost1;
 var employeeCar;
 var employeePin;
 var employeePin1;
 var cost2;
// ignore: must_be_immutable
class customRow1 extends StatefulWidget {
      customRow1(this.text, this.hint, this.isSearch, context,{super.key});
    var  text;
    var  hint;
    var isSearch;
  @override
  State<customRow1> createState() => _customRow1State();
}

class _customRow1State extends State<customRow1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2, left: 8, right: 8),
        child:
       widget.text == 'الحالة: '.tr() ?
        Row(
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
                  fontSize: 16.sp,
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
                    fontSize: 16.sp
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
                        borderRadius:
                        BorderRadius.circular(5.r),
                        borderSide: const BorderSide(
                            color: Colors.black54)),enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide:
                      const BorderSide(color: Colors.black54)),
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(5.w, 1.h, 5.w, 1.h),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.r),
                        borderSide:
                        BorderSide(color: Colors.red, width: 1.w)),
                    labelStyle: TextStyle(fontFamily: 'tj',
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
            : widget.text == 'من تاريخ: '.tr() ?
        Row(
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: ()async{
                          DateTime?
                          newDate =
                          await showDatePicker(
                            useRootNavigator: false,
                            context: context,
                            barrierDismissible: false,
                            firstDate: DateTime(
                                2024),
                            lastDate: DateTime(
                                3000),
                            initialDate: DateTime.now(),
                          );
                          if (newDate == null) {return;}
                          setState(() {
                            newDate.day.toString();
                            newDate.month.toString();
                            newDate.year.toString();
                            date = DateFormat('yyyy-MM-dd', 'en').format(newDate);
                          });

                        },
                        child: SizedBox(
                          width: EasyLocalization.of(
                              navigatorKey.currentContext!)!
                              .currentLocale ==
                              const Locale('en', '')
                              ? 80.w
                              : 100.w,
                          child: TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontFamily: 'tj',
                                    color: Colors.red,
                                    fontSize: ScreenUtil().orientation ==
                                        Orientation.landscape
                                        ? 10.sp
                                        : 10.sp),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    0.0, 12.0, 0.0, 0.0),
                                hintText: ' ${date??''}',
                                hintStyle: const TextStyle(fontFamily: 'tj',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                        color: Colors.black54)),enabledBorder: OutlineInputBorder(
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () async {
                          TimeOfDay? newDate = await showTimePicker(
                            useRootNavigator: false,
                            context: context,
                            barrierDismissible: false,
                            initialTime: TimeOfDay.now(),
                            initialEntryMode:
                            TimePickerEntryMode.dial,
                          );
                          if (newDate == null) return;

                          setState(() {

                            final now =  DateTime.now();
                            var date= DateTime(now.year, now.month, now.day, newDate.hour, newDate.minute);
                            time = DateFormat("HH:mm",'en').format(date);

                            // print(newDate.replacing().toString().replaceAll('TimeOfDay(', '').replaceAll(')', ''));
                          });
                        },
                        child: SizedBox(
                          width: EasyLocalization.of(
                              navigatorKey.currentContext!)!
                              .currentLocale ==
                              const Locale('en', '')
                              ? 80.w
                              : 100.w,
                          child: TextFormField( enabled: false,
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontFamily: 'tj',
                                    color: Colors.red,
                                    fontSize: ScreenUtil().orientation ==
                                        Orientation.landscape
                                        ? 10.sp
                                        : 10.sp),
                                contentPadding: const EdgeInsets.fromLTRB(
                                    0.0, 12.0, 0.0, 0.0),
                                hintText: ' ${time??''}',
                                hintStyle: const TextStyle(fontFamily: 'tj',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                        color: Colors.black54)),enabledBorder: OutlineInputBorder(
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
                        ),
                      )
                    ],
                  ))
            ])
            :widget.isSearch == 'Column' ?
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 150.w,
                    child: CustomText(
                        align: TextAlign.end,
                       text: widget.text,
                        line: 2,
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5.w),
                SizedBox(
                  width: 150.w,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (widget.text == 'رقم اللوحة: '.tr()&&(plate == null)) {
                        return 'من فضلك أدخل بيانات اللوحة'.tr();
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            fontFamily: 'tj',
                            color: Colors.red,
                            fontSize: ScreenUtil().orientation == Orientation.landscape
                                ? 10.sp
                                : 10.sp),
                        contentPadding: const EdgeInsets.fromLTRB(
                            0.0, 12.0, 0.0, 0.0),
                        hintText: ' ${widget.text == 'رقم اللوحة: '.tr()
                            ? (plate == null ? '' : plate['Plate_No'])
                            :
                        widget.text == 'العميل: '.tr()
                            ? (customer == null ? '' : customer['Cust_No'])
                            :
                        widget.text == 'مكان المفتاح: '.tr()
                            ? (placeKey == null ? '' : placeKey['Sub_Code'])
                            :
                        widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()
                            ? (placeKeyReci == null ? '' : placeKeyReci['Sub_Code'])
                            :
                        widget.text == 'رقم العقد: '.tr()
                            ? (contract == null ? '' : contract['Prj_No'])
                            :
                        widget.text == 'الموظف: '.tr()
                            ? (employee == null ? '' : employee['Emp_Code'])
                            :
                        widget.text == 'مستخدم السيارة: '.tr()
                            ? (employeeCar == null ? '' : employeeCar['Emp_Code'])
                            :
                        widget.text == 'مستلم المفتاح: '.tr()
                            ? (employeePin == null ? '' : employeePin['Emp_Code'])
                            :
                        widget.text == 'مستلم المفتاح الاحتياطى: '.tr()
                            ? (employeePin1 == null ? '' : employeePin1['Emp_Code'])
                            :
                        widget.text == 'من مركز التلكفة: '.tr()
                            ? (cost1 == null ? '' : cost1['CST_No'])
                            :
                        widget.text == 'الى مركز التلكفة: '.tr()
                            ? (cost2 == null ? '' : cost2['CST_No'])
                            :
                        widget.text == 'من مكان: '.tr()
                            ? (place1 == null ? '' : place1['Sub_Code'])
                            :
                        widget.text == 'الى مكان: '.tr()
                            ? (place2 == null ? '' : place2['Sub_Code'])
                            : ''}',
                        hintStyle: const TextStyle(fontFamily: 'tj',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: Colors.black54)),enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                            color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.black54, width: .1.w, style: BorderStyle.solid)),
                        suffixIconColor: Colors.black),
                  ),
                ),
                SizedBox(width: 5.w),
               widget.isSearch == null
                    ? const SizedBox()
                    : InkWell(
                  onTap: () {
                    showDialog(
                        useRootNavigator: false,
                        context: context,
                        builder: (dialogContext) {
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                           text:
                                            widget.text == 'رقم اللوحة: '.tr() ? 'نافذه استعلاميه عن اللوحات'.tr()
                                                :
                                            widget.text == 'العميل: '.tr() ? 'العملاء'.tr()
                                                :
                                            widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr() ? 'الموظفين'.tr()
                                                :
                                            widget.text == 'رقم العقد: '.tr() ? 'العقود'.tr()
                                                :
                                            widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مستلم المفتاح: '.tr()||widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr() ? "الأماكن".tr()
                                                :
                                            widget.text == 'من مركز التلكفة: '.tr()|| widget.text == 'الى مركز التلكفة: '.tr()? 'نافذه استعلاميه عن مراكز التلكفة'.tr()
                                                :
                                            'نافذه استعلاميه عن الموظفين'.tr(),
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            ScreenUtil().orientation == Orientation.landscape
                                                ? 8.sp
                                                : 16.sp,
                                            color: Colors.black),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              MagicRouter.pop();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.r),
                                                    color: Colors.red),
                                                child: Icon(Icons.close,
                                                    color: Colors.white, size: 20.w))),
                                      ],
                                    )
                                  ],
                                ),
                                content: SizedBox(
                                    height: .3.sh,
                                    width: 1.sw,
                                    child:
                                    Column(
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
                                                      text: widget.text == 'رقم اللوحة: '.tr()
                                                          ? "رقم اللوحة".tr()
                                                          :
                                                      widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مستلم المفتاح: '.tr()||widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr() ||widget.text == 'رقم العقد: '.tr()||widget.text == 'الى مركز التلكفة: '.tr()||  widget.text == 'العميل: '.tr()||widget.text== 'من مركز التلكفة: '.tr()||widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()
                                                          ? "الكود".tr()
                                                          : 'كود الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  CustomText(
                                                     text:
                                                      widget.text == 'رقم اللوحة: '.tr() || widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                          ? "الوصف".tr():
                                                      widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مستلم المفتاح: '.tr()||widget.text=='من مكان: '.tr()||   widget.text == 'العميل: '.tr()||widget.text== 'الى مكان: '.tr()
                                                          ? 'الإسم'.tr()
                                                          :
                                                      widget.text == 'رقم العقد: '.tr()
                                                          ? 'الحاله'.tr()
                                                          : 'اسم الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  // widget.text == 'العميل: '.tr()||widget.text == 'العميل: '.tr()|| widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()||   widget.text == 'رقم اللوحة: '.tr()|| widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                  //     ? const SizedBox()
                                                  //     : CustomText(
                                                  //     widget.text: 'رقم التليفون'.tr(),
                                                  //     fontWeight: FontWeight.bold,
                                                  //     fontSize: ScreenUtil().orientation ==
                                                  //         Orientation.landscape
                                                  //         ? 8.sp
                                                  //         : 13.sp,
                                                  //     color: Colors.black)
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child:
                                            widget.text == 'رقم اللوحة: '.tr() &&HomeCubit.get(context).GetListPlate==null
                                                ?const SizedBox():
                                            widget.text == 'رقم العقد: '.tr() &&HomeCubit.get(context).GetListContract==null
                                                ?const SizedBox():
                                            (widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr() ) &&HomeCubit.get(context).GetListEmployee==null
                                                ?const SizedBox():
                                            widget.text == 'العميل: '.tr() &&HomeCubit.get(context).GetListCustomer==null
                                                ?const SizedBox():
                                            ( widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()) &&HomeCubit.get(context).GetListPlace==null
                                                ?const SizedBox():
                                            ( widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مستلم المفتاح: '.tr()) &&HomeCubit.get(context).GetListKeyPlace==null
                                                ?const SizedBox():
                                            (widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()) && HomeCubit.get(context).GetListCost==null
                                                ?const SizedBox():
                                            ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount:
                                              widget.text == 'رقم اللوحة: '.tr()
                                                  ? HomeCubit.get(context).GetListPlate!.length
                                                  :
                                              widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مستلم المفتاح: '.tr()
                                                  ? HomeCubit.get(context).GetListKeyPlace!.length
                                                  :
                                              widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr()
                                                  ? HomeCubit.get(context).GetListEmployee!.length
                                                  :
                                              widget.text == 'رقم العقد: '.tr()
                                                  ? HomeCubit.get(context).GetListContract!.length
                                                  :
                                              widget.text == 'العميل: '.tr()
                                                  ? HomeCubit.get(context).GetListCustomer.length
                                                  :
                                              widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()
                                                  ? HomeCubit.get(context).GetListPlace!.length
                                                  :
                                              widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                  ? HomeCubit.get(context).GetListCost!.length
                                                  : 3,
                                              scrollDirection: Axis.vertical,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    widget.text == 'رقم اللوحة: '.tr()
                                                        ? {
                                                      setState(() {

                                                        // setState(() {
                                                        plate = HomeCubit.get(context).GetListPlate[index];
                                                        // });
                                                        formKey.currentState!.validate();
                                                        MagicRouter.pop();
                                                      }),}
                                                        :widget.text == 'مكان المفتاح: '.tr()
                                                        ? {
                                                      setState(() {
                                                        placeKey = HomeCubit.get(context).GetListKeyPlace[index];
                                                        formKey.currentState!.validate();
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()
                                                        ? {
                                                      setState(() {
                                                        placeKeyReci = HomeCubit.get(context).GetListKeyPlace[index];
                                                        formKey.currentState!.validate();
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'رقم العقد: '.tr()
                                                        ? {
                                                      setState(() {
                                                        contract = HomeCubit.get(context).GetListContract[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'الموظف: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employee = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'مستخدم السيارة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeeCar = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'مستلم المفتاح: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeePin = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'مستلم المفتاح الاحتياطى: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeePin1 = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text == 'العميل: '.tr()
                                                        ? {
                                                      setState(() {
                                                        customer = HomeCubit.get(context).GetListCustomer[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : widget.text=='من مكان: '.tr()
                                                        ? {
                                                      setState(() {
                                                        place1 = HomeCubit.get(context).GetListPlace[index];
                                                        MagicRouter.pop();})}
                                                        : widget.text== 'الى مكان: '.tr()
                                                        ? {
                                                      setState(() {
                                                        place2 = HomeCubit.get(context).GetListPlace[index];
                                                        MagicRouter.pop();}),}
                                                        : widget.text == 'الى مركز التلكفة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        cost2 = HomeCubit.get(context).GetListCost[index];
                                                        MagicRouter.pop();})}
                                                        : widget.text== 'من مركز التلكفة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        cost1 = HomeCubit.get(context).GetListCost[index];
                                                        MagicRouter.pop();})}
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
                                                            text: widget.text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context).GetListPlate[index]['Plate_No']
                                                                :
                                                            widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr()
                                                                ? HomeCubit.get(context).GetListEmployee[index]['Emp_Code']
                                                                :
                                                            widget.text == 'رقم العقد: '.tr()
                                                                ? HomeCubit.get(context).GetListContract[index]['Prj_No']
                                                                :
                                                            widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                                ? HomeCubit.get(context).GetListCost[index]['CST_No']
                                                                :
                                                            widget.text == 'العميل: '.tr()
                                                                ? HomeCubit.get(context).GetListCustomer[index]['Cust_No'].toString()
                                                                :
                                                            widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مكان المفتاح: '.tr()
                                                                ? HomeCubit.get(context).GetListKeyPlace[index]['Sub_Code'].toString()
                                                                :
                                                            widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()
                                                                ? HomeCubit.get(context).GetListPlace[index]['Sub_Code'].toString()
                                                                : '123',
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            ScreenUtil().orientation ==
                                                                Orientation.landscape
                                                                ? 6.sp
                                                                : 13.sp,
                                                            color: Colors.black),
                                                        CustomText(
                                                           text: widget.text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context).GetListPlate[index]['fa_DSC'].toString()
                                                                :  widget.text == 'العميل: '.tr()
                                                                ? HomeCubit.get(context).GetListCustomer[index]['DSCR'].toString()
                                                                : widget.text == 'مستلم المفتاح الاحتياطى: '.tr()  || widget.text == 'الموظف: '.tr()  ||widget.text == 'مستخدم السيارة: '.tr()||widget.text == 'مستلم المفتاح: '.tr()
                                                                ? HomeCubit.get(context).GetListEmployee[index]['Emp_NM'].toString()
                                                                : widget.text == 'رقم العقد: '.tr()
                                                                ? HomeCubit.get(context).GetListContract[index]['Stat_Nm'].toString()
                                                                : widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                                ? ( HomeCubit.get(context).GetListCost[index]['CST_NM'])
                                                                : widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()||widget.text == 'مكان المفتاح: '.tr()
                                                                ? ( HomeCubit.get(context).GetListKeyPlace[index]['Name'])
                                                                : widget.text=='من مكان: '.tr()||widget.text== 'الى مكان: '.tr()
                                                                ? ( HomeCubit.get(context).GetListPlace[index]['Name'])
                                                                : 'محمد عاطف',
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            ScreenUtil().orientation ==
                                                                Orientation.landscape
                                                                ? 6.sp
                                                                : 13.sp,
                                                            color: Colors.black),
                                                        // widget.text=='من مكان: '.tr()||widget.text == 'العميل: '.tr()||widget.text== 'الى مكان: '.tr()||    widget.text == 'رقم اللوحة: '.tr()||widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                        //     ? const SizedBox()
                                                        //     : CustomText(
                                                        //     widget.text: '01021424949',
                                                        //     fontWeight: FontWeight.w600,
                                                        //     fontSize: ScreenUtil()
                                                        //         .orientation ==
                                                        //         Orientation.landscape
                                                        //         ? 6.sp
                                                        //         : 13.sp,
                                                        //     color: Colors.black)
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                )),
                          );
                        });
                  },
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
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 205.w,
                  child: TextFormField(
                    enabled: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (widget.text == 'رقم اللوحة: '.tr()&&(plate == null||plate == '')) {
                        return 'من فضلك أدخل بيانات اللوحة'.tr();
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            fontFamily: 'tj',
                            color: Colors.red,
                            fontSize: ScreenUtil().orientation ==
                                Orientation.landscape
                                ? 10.sp
                                : 10.sp),
                        contentPadding: const EdgeInsets.fromLTRB(
                            0.0, 0.0, 0.0, 0.0),
                        hintText: ' ${widget.text == 'رقم اللوحة: '.tr()
                            ? (plate == null ? '' : plate['fa_DSC'])
                            : widget.text == 'من مركز التلكفة: '.tr()
                            ? (cost1 == null ? '' : ( cost1['CST_NM']))
                            : widget.text == 'الى مركز التلكفة: '.tr()
                            ? (cost2 == null ? '' : ( cost2['CST_NM']))
                            :  widget.text == 'العميل: '.tr()
                            ? (customer == null ? '' : (customer['DSCR']))
                            : widget.text == 'الموظف: '.tr()
                            ? (employee == null ? '' : (employee['Emp_NM']))
                            : widget.text == 'مستخدم السيارة: '.tr()
                            ? (employeeCar == null ? '' : (employeeCar['Emp_NM']))
                            : widget.text == 'مستلم المفتاح: '.tr()
                            ? (employeePin == null ? '' : (employeePin['Emp_NM']))
                            :   widget.text == 'مستلم المفتاح الاحتياطى: '.tr()
                            ? (employeePin1 == null ? '' : (employeePin1['Emp_NM']))
                            : widget.text == 'رقم العقد: '.tr()
                            ? (contract == null ? '' : (contract['Stat_Nm']))
                            : widget.text == 'من مكان: '.tr()
                            ? (place1 == null ? '' : (place1['Name']))
                            : widget.text == 'الى مكان: '.tr()
                            ? (place2 == null ? '' : ( place2['Name']))
                            : widget.text == 'مكان مستلم المفتاح الاحتياطى: '.tr()
                            ? (placeKeyReci == null ? '' : (placeKeyReci['Name']))
                            : widget.text == 'مكان المفتاح: '.tr()
                            ? (placeKey == null ? '' : ( placeKey['Name']))
                            : ''}',
                        hintStyle: const TextStyle(fontFamily: 'tj',
                            color: Colors.black,
                            fontWeight: FontWeight.w700),
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.r),
                            borderSide: const BorderSide(
                                color: Colors.black54)),enabledBorder: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(10.r),
                        borderSide: const BorderSide(
                            color: Colors.black54)),
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(10.r),
                            borderSide: BorderSide(color: Colors.black54, width: .1.w, style: BorderStyle.solid)),
                        suffixIconColor: Colors.black),
                  ),
                )
              ],
            )
          ],
        )
            : Row(
          crossAxisAlignment: widget.text == 'قراءة العداد الحالية: '.tr() &&curCntr!.text.isEmpty?CrossAxisAlignment.start:CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 150.w,
              child: CustomText(
                  align: TextAlign.end,
                  text: widget.text,
                  line: 2,
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5.w),
            Row(
              children: [
                InkWell(
                  onTap:widget.text=='تاريخ الاسترجاع المتوقع: '.tr()||widget.text=='تاريخ الحركة: '.tr()? () async{
                    DateTime?
                    newDate =
                    await showDatePicker(
                      useRootNavigator: false,
                      context: context,
                      barrierDismissible: false,
                      firstDate: DateTime(
                          2024),
                      lastDate: DateTime(
                          3000),
                      initialDate: DateTime.now(),
                    );
                    if (newDate == null) {return;}
                    setState(() {
                      newDate.day.toString();
                      newDate.month.toString();
                      newDate.year.toString();
                      widget.text=='تاريخ الاسترجاع المتوقع: '.tr()?
                      date1 = DateFormat('yyyy-MM-dd', 'en').format(newDate):
                      date2 = DateFormat('yyyy-MM-dd', 'en').format(newDate);
                    });
                  }
                      :(){},
                  child: SizedBox(
                    width: 150.w,
                    child: BlocConsumer<HomeCubit, HomeState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if(state is GetMaxKeySuccess){
                          HomeCubit.get(context).GetMaxKey;
                        }
                        return TextFormField(
                            controller: widget.text == 'ملاحظات: '.tr()? Notes:
                            widget.text == 'قراءة العداد الحالية: '.tr()?curCntr:
                            widget.text == 'قراءة العداد السابقة: '.tr()?prvCntr:
                            null,
                            onChanged: (value) {
                              setState(() {
                                widget.text == 'ملاحظات: '.tr()? Notes!.text=value:
                                widget.text == 'قراءة العداد الحالية: '.tr()?curCntr!.text=value:
                                widget.text == 'قراءة العداد السابقة: '.tr()?prvCntr!.text=value:'';

                              });
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (widget.text == 'قراءة العداد الحالية: '.tr() &&curCntr!.text.isEmpty) {
                                return 'من فضلك أدخل قراءة العداد الحالية'.tr();
                              }
                              return null;
                            },
                            keyboardType:widget.text == 'قراءة العداد الحالية: '.tr()|| widget.text == 'قراءة العداد السابقة: '.tr()? TextInputType.number: TextInputType.name,
                            enabled:widget.text=='تاريخ الاسترجاع المتوقع: '.tr()||widget.text=='تاريخ الحركة: '.tr()||widget.text=='رقم الحركة: '.tr()? false:true,
                            inputFormatters: widget.text == 'قراءة العداد الحالية: '.tr()|| widget.text == 'قراءة العداد السابقة: '.tr()?[FilteringTextInputFormatter.deny(','),FilteringTextInputFormatter.deny('-')]:[],
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontFamily: 'tj',
                                    color: Colors.red,
                                    fontSize: ScreenUtil().orientation ==
                                        Orientation.landscape ? 10.sp : 10.sp),
                                contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                hintText: ' ${widget.text=='رقم الحركة: '.tr()? (HomeCubit.get(context).GetMaxKey??''):widget.text=='تاريخ الاسترجاع المتوقع: '.tr()? (date1??''):widget.text=='تاريخ الحركة: '.tr()?(date2??''):''}',
                                hintStyle: const TextStyle(fontFamily: 'tj',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                filled: true,
                                fillColor: Colors.white,
                                disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: const BorderSide(
                                        color: Colors.black54)),enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: const BorderSide(color: Colors.black54)),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(color: Colors.black54, width: .1.w, style: BorderStyle.solid)),
                                suffixIconColor: Colors.black)
                        );},
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
               widget.isSearch == null
                    ? const SizedBox()
                    : InkWell(
                  onTap: () {
                    showDialog(
                        useRootNavigator: false,
                        context: context,
                        builder: (dialogContext) {
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomText(
                                           text: widget.text == 'رقم اللوحة: '.tr()?
                                            'نافذه استعلاميه عن اللوحات'.tr():
                                            widget.text == 'من مركز التلكفة: '.tr()|| widget.text == 'الى مركز التلكفة: '.tr()?
                                            'نافذه استعلاميه عن مراكز التلكفة'.tr():
                                            'نافذه استعلاميه عن الموظفين'.tr(),
                                            fontWeight: FontWeight.bold,
                                            fontSize:
                                            ScreenUtil().orientation == Orientation.landscape
                                                ? 8.sp
                                                : 16.sp,
                                            color: Colors.black),
                                      ],
                                    ),
                                    const Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              MagicRouter.pop();
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20.r),
                                                    color: Colors.red),
                                                child: Icon(Icons.close,
                                                    color: Colors.white, size: 20.w))),
                                      ],
                                    )
                                  ],
                                ),
                                content: SizedBox(
                                    height: .5.sh,
                                    width: 1.sw,
                                    child:
                                    Column(
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
                                                   text: widget.text == 'رقم اللوحة: '.tr()
                                                          ? "رقم اللوحة".tr()
                                                          :
                                                      widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                          ? "الكود".tr()
                                                          : 'كود الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  CustomText(
                                                      text: widget.text == 'رقم اللوحة: '.tr() || widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                          ? "الوصف".tr()
                                                          : 'اسم الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  widget.text == 'رقم اللوحة: '.tr()|| widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
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
                                            child:
                                            widget.text == 'رقم اللوحة: '.tr() &&HomeCubit.get(context).GetListPlate==null
                                                ?const SizedBox():
                                            (widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()) && HomeCubit.get(context).GetListCost==null
                                                ?const SizedBox():

                                            ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount:
                                              widget.text == 'رقم اللوحة: '.tr()
                                                  ? HomeCubit.get(context)
                                                  .GetListPlate!
                                                  .length
                                                  :
                                              widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                  ? HomeCubit.get(context)
                                                  .GetListCost!
                                                  .length
                                                  : 3,
                                              scrollDirection: Axis.vertical,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    widget.text == 'رقم اللوحة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        plate ==
                                                            HomeCubit.get(context)
                                                                .GetListPlate[index];
                                                        plate =
                                                        HomeCubit.get(context)
                                                            .GetListPlate[index];
                                                        MagicRouter.pop();
                                                      }),
                                                    }: widget.text == 'الى مركز التلكفة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        cost2 ==
                                                            HomeCubit.get(context)
                                                                .GetListCost[index];
                                                        cost2 =
                                                        HomeCubit.get(context)
                                                            .GetListCost[index];
                                                        MagicRouter.pop();
                                                      }),
                                                    }
                                                        : widget.text== 'من مركز التلكفة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        cost1 ==
                                                            HomeCubit.get(context)
                                                                .GetListCost[index];
                                                        cost1 =
                                                        HomeCubit.get(context)
                                                            .GetListCost[index];
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
                                                            text: widget.text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListPlate[index]
                                                            ['Plate_No']
                                                                :
                                                            widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListCost[index]
                                                            ['CST_No']
                                                                : '123',
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            ScreenUtil().orientation ==
                                                                Orientation.landscape
                                                                ? 6.sp
                                                                : 13.sp,
                                                            color: Colors.black),
                                                        CustomText(
                                                           text: widget.text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListPlate[index]
                                                            ['fa_DSC']
                                                                .toString()
                                                                :
                                                            widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListCost[index]
                                                            ['CST_NM_AR']
                                                                :
                                                            'محمد عاطف',
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            ScreenUtil().orientation ==
                                                                Orientation.landscape
                                                                ? 6.sp
                                                                : 13.sp,
                                                            color: Colors.black),
                                                        widget.text == 'رقم اللوحة: '.tr()||widget.text == 'الى مركز التلكفة: '.tr()||widget.text== 'من مركز التلكفة: '.tr()
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
                                    )
                                )),
                          );
                        });
                  },
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
}

