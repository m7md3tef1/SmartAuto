part of '../view.dart';



// ignore: must_be_immutable
class AnnualPickupCar extends StatefulWidget {
  AnnualPickupCar(this.nameCar, this.nameButton, {super.key});
  var nameCar;
  var nameButton;

  @override
  State<AnnualPickupCar> createState() => _AnnualPickupCarState();
}

class _AnnualPickupCarState extends State<AnnualPickupCar> {
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
  var time;
  var cost1;
  var employeeCar;
  var employeePin;
  var employeePin1;
  var cost2;
  var  formKey = GlobalKey<FormState>();
  customRow1(text, hint, isSearch, context) {
    return Padding(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2, left: 8, right: 8),
        child:
        text == 'الحالة: '.tr() ?
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
            : text == 'من تاريخ: '.tr() ?
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
                            fontSize: 18.sp,
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
                                hintStyle: const TextStyle(
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
                            fontSize: 18.sp,
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
                                hintStyle: const TextStyle(
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
            : isSearch == 'Column' ?
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
                        text: text,
                        line: 2,
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)
                ),
                SizedBox(width: 5.w),
                SizedBox(
                  width: 150.w,
                  child: TextFormField(
                    validator: (value) {
                      if (text == 'رقم اللوحة: '.tr()&&plate == null) {
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
                        hintText: ' ${text == 'رقم اللوحة: '.tr()
                            ? (plate == null ? '' : plate['Plate_No'])
                            :
                        text == 'العميل: '.tr()
                            ? (customer == null ? '' : customer['Cust_No'])
                            :
                        text == 'رقم العقد: '.tr()
                            ? (contract == null ? '' : contract['Prj_No'])
                            :
                        text == 'الموظف: '.tr()
                            ? (employee == null ? '' : employee['Emp_Code'])
                            :

                        text == 'مستخدم السيارة: '.tr()
                            ? (employeeCar == null ? '' : employeeCar['Emp_Code'])
                            :
                        text == 'مستلم المفتاح: '.tr()
                            ? (employeePin == null ? '' : employeePin['Emp_Code'])
                            :
                        text == 'مستلم المفتاح الاحتياطى: '.tr()
                            ? (employeePin1 == null ? '' : employeePin1['Emp_Code'])
                            :

                        text == 'من مركز التلكفة: '.tr()
                            ? (cost1 == null ? '' : cost1['CST_No'])
                            :
                        text == 'الى مركز التلكفة: '.tr()
                            ? (cost2 == null ? '' : cost2['CST_No'])
                            :
                        text == 'من مكان: '.tr()
                            ? (place1 == null ? '' : place1['Sub_Code'])
                            :
                        text == 'الى مكان: '.tr()
                            ? (place2 == null ? '' : place2['Sub_Code'])
                            : ''}',
                        hintStyle: const TextStyle(
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
                isSearch == null
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
                                            text == 'رقم اللوحة: '.tr() ? 'نافذه استعلاميه عن اللوحات'.tr()
                                                :
                                            text == 'العميل: '.tr() ? 'العملاء'.tr()
                                                :
                                            text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr() ? 'الموظفين'.tr()
                                                :
                                            text == 'رقم العقد: '.tr() ? 'العقود'.tr()
                                                :
                                            text=='من مكان: '.tr()||text== 'الى مكان: '.tr() ? "الأماكن".tr()
                                                :
                                            text == 'من مركز التلكفة: '.tr()|| text == 'الى مركز التلكفة: '.tr()? 'نافذه استعلاميه عن مراكز التلكفة'.tr()
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
                                                      text: text == 'رقم اللوحة: '.tr()
                                                          ? "رقم اللوحة".tr()
                                                          :
                                                      text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr() ||text == 'رقم العقد: '.tr()||text == 'الى مركز التلكفة: '.tr()||  text == 'العميل: '.tr()||text== 'من مركز التلكفة: '.tr()||text=='من مكان: '.tr()||text== 'الى مكان: '.tr()
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
                                                      text == 'رقم اللوحة: '.tr() || text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                          ? "الوصف".tr():
                                                      text=='من مكان: '.tr()||   text == 'العميل: '.tr()||text== 'الى مكان: '.tr()
                                                          ? 'الإسم'.tr()
                                                          :
                                                      text == 'رقم العقد: '.tr()
                                                          ? 'الحاله'.tr()
                                                          : 'اسم الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  // text == 'العميل: '.tr()||text == 'العميل: '.tr()|| text=='من مكان: '.tr()||text== 'الى مكان: '.tr()||   text == 'رقم اللوحة: '.tr()|| text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                  //     ? const SizedBox()
                                                  //     : CustomText(
                                                  //     text: 'رقم التليفون'.tr(),
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
                                            text == 'رقم اللوحة: '.tr() &&HomeCubit.get(context).GetListPlate==null
                                                ?const SizedBox():
                                            text == 'رقم العقد: '.tr() &&HomeCubit.get(context).GetListContract==null
                                                ?const SizedBox():
                                            (text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr() ) &&HomeCubit.get(context).GetListEmployee==null
                                                ?const SizedBox():
                                            text == 'العميل: '.tr() &&HomeCubit.get(context).GetListCustomer==null
                                                ?const SizedBox():
                                            ( text=='من مكان: '.tr()||text== 'الى مكان: '.tr()) &&HomeCubit.get(context).GetListPlace==null
                                                ?const SizedBox():
                                            (text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()) && HomeCubit.get(context).GetListCost==null
                                                ?const SizedBox():

                                            ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount:
                                              text == 'رقم اللوحة: '.tr()
                                                  ? HomeCubit.get(context).GetListPlate!.length
                                                  :
                                              text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr()
                                                  ? HomeCubit.get(context).GetListEmployee!.length
                                                  :
                                              text == 'رقم العقد: '.tr()
                                                  ? HomeCubit.get(context).GetListContract!.length
                                                  :
                                              text == 'العميل: '.tr()
                                                  ? HomeCubit.get(context).GetListCustomer.length
                                                  :
                                              text=='من مكان: '.tr()||text== 'الى مكان: '.tr()
                                                  ? HomeCubit.get(context).GetListPlace!.length
                                                  :
                                              text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                  ? HomeCubit.get(context).GetListCost!.length
                                                  : 3,
                                              scrollDirection: Axis.vertical,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    text == 'رقم اللوحة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        plate = HomeCubit.get(context).GetListPlate[index];
                                                        formKey.currentState!.validate();
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'رقم العقد: '.tr()
                                                        ? {
                                                      setState(() {
                                                        contract = HomeCubit.get(context).GetListContract[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'الموظف: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employee = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'مستخدم السيارة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeeCar = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'مستلم المفتاح: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeePin = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'مستلم المفتاح الاحتياطى: '.tr()
                                                        ? {
                                                      setState(() {
                                                        employeePin1 = HomeCubit.get(context).GetListEmployee[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text == 'العميل: '.tr()
                                                        ? {
                                                      setState(() {
                                                        customer = HomeCubit.get(context).GetListCustomer[index];
                                                        MagicRouter.pop();
                                                      }),}
                                                        : text=='من مكان: '.tr()
                                                        ? {
                                                      setState(() {
                                                        place1 = HomeCubit.get(context).GetListPlace[index];
                                                        MagicRouter.pop();})}
                                                        : text== 'الى مكان: '.tr()
                                                        ? {
                                                      setState(() {
                                                        place2 = HomeCubit.get(context).GetListPlace[index];
                                                        MagicRouter.pop();}),}
                                                        : text == 'الى مركز التلكفة: '.tr()
                                                        ? {
                                                      setState(() {
                                                        cost2 = HomeCubit.get(context).GetListCost[index];
                                                        MagicRouter.pop();})}
                                                        : text== 'من مركز التلكفة: '.tr()
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
                                                            text: text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context).GetListPlate[index]['Plate_No']
                                                                :
                                                            text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr()
                                                                ? HomeCubit.get(context).GetListEmployee[index]['Emp_Code']
                                                                :
                                                            text == 'رقم العقد: '.tr()
                                                                ? HomeCubit.get(context).GetListContract[index]['Prj_No']
                                                                :
                                                            text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                                ? HomeCubit.get(context).GetListCost[index]['CST_No']
                                                                :
                                                            text == 'العميل: '.tr()
                                                                ? HomeCubit.get(context).GetListCustomer[index]['Cust_No'].toString()
                                                                :
                                                            text=='من مكان: '.tr()||text== 'الى مكان: '.tr()
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
                                                            text: text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context).GetListPlate[index]['fa_DSC'].toString()
                                                                :  text == 'العميل: '.tr()
                                                                ? HomeCubit.get(context).GetListCustomer[index]['DSCR'].toString()
                                                                : text == 'مستلم المفتاح الاحتياطى: '.tr()  || text == 'الموظف: '.tr()  ||text == 'مستخدم السيارة: '.tr()||text == 'مستلم المفتاح: '.tr()
                                                                ? HomeCubit.get(context).GetListEmployee[index]['Emp_NM'].toString()
                                                                : text == 'رقم العقد: '.tr()
                                                                ? HomeCubit.get(context).GetListContract[index]['Stat_Nm'].toString()
                                                                : text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                                ? ( HomeCubit.get(context).GetListCost[index]['CST_NM'])
                                                                : text=='من مكان: '.tr()||text== 'الى مكان: '.tr()
                                                                ? ( HomeCubit.get(context).GetListPlace[index]['Name'])
                                                                : 'محمد عاطف',
                                                            fontWeight: FontWeight.w600,
                                                            fontSize:
                                                            ScreenUtil().orientation ==
                                                                Orientation.landscape
                                                                ? 6.sp
                                                                : 13.sp,
                                                            color: Colors.black),
                                                        // text=='من مكان: '.tr()||text == 'العميل: '.tr()||text== 'الى مكان: '.tr()||    text == 'رقم اللوحة: '.tr()||text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                        //     ? const SizedBox()
                                                        //     : CustomText(
                                                        //     text: '01021424949',
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
                  child: TextFormField( enabled: false,
                    validator: (value) {
                      if (text == 'رقم اللوحة: '.tr()&&plate == null) {
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
                        hintText: ' ${text == 'رقم اللوحة: '.tr()
                            ? (plate == null ? '' : plate['fa_DSC'])
                            : text == 'من مركز التلكفة: '.tr()
                            ? (cost1 == null ? '' : ( cost1['CST_NM']))
                            : text == 'الى مركز التلكفة: '.tr()
                            ? (cost2 == null ? '' : ( cost2['CST_NM']))
                            :  text == 'العميل: '.tr()
                            ? (customer == null ? '' : (customer['DSCR']))
                            : text == 'الموظف: '.tr()
                            ? (employee == null ? '' : (employee['Emp_NM']))
                            : text == 'مستخدم السيارة: '.tr()
                            ? (employeeCar == null ? '' : (employeeCar['Emp_NM']))
                            : text == 'مستلم المفتاح: '.tr()
                            ? (employeePin == null ? '' : (employeePin['Emp_NM']))
                            :   text == 'مستلم المفتاح الاحتياطى: '.tr()
                            ? (employeePin1 == null ? '' : (employeePin1['Emp_NM']))
                            : text == 'رقم العقد: '.tr()
                            ? (contract == null ? '' : (contract['Stat_Nm']))
                            : text == 'من مكان: '.tr()
                            ? (place1 == null ? '' : (place1['Name']))
                            : text == 'الى مكان: '.tr()
                            ? (place2 == null ? '' : ( place2['Name']))
                            : ''}',
                        hintStyle: const TextStyle(
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
          crossAxisAlignment: text == 'قراءة العداد الحالية: '.tr() &&curCntr!.text.isEmpty?CrossAxisAlignment.start:CrossAxisAlignment.center,
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
                InkWell(
                  onTap:text=='تاريخ الاسترجاع المتوقع: '.tr()||text=='تاريخ الحركة: '.tr()? () async{
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
                      text=='تاريخ الاسترجاع المتوقع: '.tr()?
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
                            controller: text == 'ملاحظات: '.tr()? Notes:
                            text == 'قراءة العداد الحالية: '.tr()?curCntr:
                            text == 'قراءة العداد السابقة: '.tr()?prvCntr:
                            null,
                            onChanged: (value) {
                              setState(() {
                                text == 'ملاحظات: '.tr()? Notes!.text=value:
                                text == 'قراءة العداد الحالية: '.tr()?curCntr!.text=value:
                                text == 'قراءة العداد السابقة: '.tr()?prvCntr!.text=value:'';

                              });
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (text == 'قراءة العداد الحالية: '.tr() &&curCntr!.text.isEmpty) {
                                return 'من فضلك أدخل قراءة العداد الحالية'.tr();
                              }
                              return null;
                            },
                            keyboardType:text == 'قراءة العداد الحالية: '.tr()|| text == 'قراءة العداد السابقة: '.tr()? TextInputType.number: TextInputType.name,
                            enabled:text=='تاريخ الاسترجاع المتوقع: '.tr()||text=='تاريخ الحركة: '.tr()||text=='رقم الحركة: '.tr()? false:true,
                            inputFormatters: text == 'قراءة العداد الحالية: '.tr()|| text == 'قراءة العداد السابقة: '.tr()?[FilteringTextInputFormatter.deny(','),FilteringTextInputFormatter.deny('-')]:[],
                            decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    fontFamily: 'tj',
                                    color: Colors.red,
                                    fontSize: ScreenUtil().orientation ==
                                        Orientation.landscape ? 10.sp : 10.sp),
                                contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 0.0),
                                hintText: ' ${text=='رقم الحركة: '.tr()? (HomeCubit.get(context).GetMaxKey??''):text=='تاريخ الاسترجاع المتوقع: '.tr()? (date1??''):text=='تاريخ الحركة: '.tr()?(date2??''):''}',
                                hintStyle: const TextStyle(
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
                isSearch == null
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
                                            text: text == 'رقم اللوحة: '.tr()?
                                            'نافذه استعلاميه عن اللوحات'.tr():
                                            text == 'من مركز التلكفة: '.tr()|| text == 'الى مركز التلكفة: '.tr()?
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
                                                      text: text == 'رقم اللوحة: '.tr()
                                                          ? "رقم اللوحة".tr()
                                                          :
                                                      text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                          ? "الكود".tr()
                                                          : 'كود الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  CustomText(
                                                      text: text == 'رقم اللوحة: '.tr() || text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                          ? "الوصف".tr()
                                                          : 'اسم الموظف'.tr(),
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: ScreenUtil().orientation ==
                                                          Orientation.landscape
                                                          ? 8.sp
                                                          : 13.sp,
                                                      color: Colors.black),
                                                  text == 'رقم اللوحة: '.tr()|| text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
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
                                            text == 'رقم اللوحة: '.tr() &&HomeCubit.get(context).GetListPlate==null
                                                ?const SizedBox():
                                            (text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()) && HomeCubit.get(context).GetListCost==null
                                                ?const SizedBox():

                                            ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.zero,
                                              itemCount:
                                              text == 'رقم اللوحة: '.tr()
                                                  ? HomeCubit.get(context)
                                                  .GetListPlate!
                                                  .length
                                                  :
                                              text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
                                                  ? HomeCubit.get(context)
                                                  .GetListCost!
                                                  .length
                                                  : 3,
                                              scrollDirection: Axis.vertical,
                                              physics: const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    text == 'رقم اللوحة: '.tr()
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
                                                    }: text == 'الى مركز التلكفة: '.tr()
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
                                                        : text== 'من مركز التلكفة: '.tr()
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
                                                            text: text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListPlate[index]
                                                            ['Plate_No']
                                                                :
                                                            text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
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
                                                            text: text == 'رقم اللوحة: '.tr()
                                                                ? HomeCubit.get(context)
                                                                .GetListPlate[index]
                                                            ['fa_DSC']
                                                                .toString()
                                                                :
                                                            text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
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
                                                        text == 'رقم اللوحة: '.tr()||text == 'الى مركز التلكفة: '.tr()||text== 'من مركز التلكفة: '.tr()
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
      'تاريخ الاسترجاع المتوقع: '.tr(),
      'أيام التأخير: '.tr(),
    ];
    List<Widget> items = List.generate(
      name.length,
      (index) {
        return customRow1(
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
                text: widget.nameCar,
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formKey,
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
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    customer=null;
                                    contract=null;
                                    plate=null;
                                    place1=null;
                                    place2=null;
                                    date=null;
                                    date1=null;
                                    date2=null;
                                    time=null;
                                    cost1=null;
                                    cost2=null;
                                    employee=null;
                                    prvCntr!.clear();
                                    Notes!.clear();
                                    curCntr!.clear();
                                  });
                                },
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
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: InkWell(
                                onTap: (){
                                  if(HomeCubit.get(context).GetMaxKey==null||curCntr!.text.isEmpty||plate==null ){
                                    formKey.currentState!.validate();
                                    showToast(msg: 'من فضلك أدخل البيانات'.tr(), state: ToastedStates.ERROR);
                                  }else{
                                    HomeCubit.get(context).add(
                                        24,
                                        HomeCubit.get(context).GetMaxKey,
                                        date2,
                                        prvCntr!.text.isEmpty?null:prvCntr!.text,
                                        curCntr!.text.isEmpty?null:curCntr!.text,
                                        (contract==null?null:contract['Prj_No']),
                                        (customer==null?null:customer['Cust_No']),
                                        date,
                                        time,
                                        Notes!.text.isEmpty?null:Notes!.text,
                                        (employee==null?null:employee['Emp_Code']),
                                        (employee==null?null:employee['Emp_Code']),
                                        (plate==null?null:plate['Plate_No']),
                                        context);
                                  }
                                },
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
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
