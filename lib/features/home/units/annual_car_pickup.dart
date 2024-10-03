part of '../view.dart';

// ignore: must_be_immutable
class AnnualPickupCar extends StatefulWidget {
  AnnualPickupCar(this.nameCar, {super.key});
  var nameCar;
  @override
  State<AnnualPickupCar> createState() => _AnnualPickupCarState();
}

class _AnnualPickupCarState extends State<AnnualPickupCar> {
  @override
  void initState() {
    customer = null;
    contract = null;
    plate = null;
    place1 = null;
    place2 = null;
    date = null;
    date1 = null;
    date2 = null;
    employeeCar = null;
    employeePin = null;
    employeePin1 = null;
    placeKey = null;
    placeKeyReci = null;
    time = null;
    cost1 = null;
    cost2 = null;
    employee = null;
    prvCntr!.clear();
    Notes!.clear();
    curCntr!.clear();
    super.initState();
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
                                onTap: () {
                                  setState(() {
                                    customer = null;
                                    contract = null;
                                    plate = null;
                                    place1 = null;
                                    place2 = null;
                                    date = null;
                                    date1 = null;
                                    date2 = null;
                                    employeeCar = null;
                                    employeePin = null;
                                    employeePin1 = null;
                                    placeKey = null;
                                    placeKeyReci = null;
                                    time = null;
                                    cost1 = null;
                                    cost2 = null;
                                    employee = null;
                                    prvCntr!.clear();
                                    Notes!.clear();
                                    curCntr!.clear();
                                  });
                                  formKey.currentState!.validate();
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
                                onTap: () {
                                  if (
                                      // HomeCubit.get(context).GetMaxKey == null ||
                                      curCntr!.text.isEmpty || plate == null) {
                                    formKey.currentState!.validate();
                                    showToast(
                                        msg: 'من فضلك أدخل البيانات'.tr(),
                                        state: ToastedStates.ERROR);
                                  } else {
                                    HomeCubit.get(context).GetMaxKey = null;
                                    HomeCubit.get(context).getMaxKey(
                                        24,
                                        24,
                                        // HomeCubit.get(context).GetMaxKey,
                                        date2,
                                        prvCntr!.text.isEmpty
                                            ? null
                                            : prvCntr!.text,
                                        curCntr!.text.isEmpty
                                            ? null
                                            : curCntr!.text,
                                        (contract == null
                                            ? null
                                            : contract['Prj_No']),
                                        (customer == null
                                            ? null
                                            : customer['Cust_No']),
                                        date,
                                        time,
                                        Notes!.text.isEmpty
                                            ? null
                                            : Notes!.text,
                                        (employee == null
                                            ? null
                                            : employee['Emp_Code']),
                                        (employee == null
                                            ? null
                                            : employee['Emp_Code']),
                                        (plate == null
                                            ? null
                                            : plate['Plate_No']),
                                        context);
                                    // HomeCubit.get(context).add(
                                    //  );
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
