part of '../view.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    List name = [
      'تسليم سيارة سنوى'.tr(),
      'تسليم سيارة يومي'.tr(),
      'إستلام سيارة سنوي'.tr(),
      'إستلام سيارة يومي'.tr(),
    ];
    return Center(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: name.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              index == 0
                  ? {
                      HomeCubit.get(context).GetMaxKey = null,
                      MagicRouter.navigateTo(
                          AnnualDeliveringCar('تسليم سيارة سنوى'.tr()))
                    }
                  : index == 1
                      ? {
                          HomeCubit.get(context).GetMaxKey = null,
                          MagicRouter.navigateTo(
                              DailyDeliveringCar('تسليم سيارة يومي'.tr()))
                        }
                      : index == 2
                          ? {
                              HomeCubit.get(context).GetMaxKey = null,
                              MagicRouter.navigateTo(
                                  AnnualPickupCar('إستلام سيارة سنوي'.tr()))
                            }
                          : {
                              HomeCubit.get(context).GetMaxKey = null,
                              MagicRouter.navigateTo(
                                  DailyPickupCar('إستلام سيارة يومي'.tr()))
                            };
            },
            child: Padding(
              padding: REdgeInsetsDirectional.only(
                  bottom: 20.h, start: 35.w, end: 35.w),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadiusDirectional.circular(20.r)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.h),
                  child: Center(
                    child: Column(
                      children: [
                        const Icon(Icons.insert_drive_file_rounded),
                        SizedBox(height: 10.h),
                        CustomText(
                            text: name[index],
                            color: Colors.black,
                            fontSize: 20.w,
                            fontWeight: FontWeight.w700)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
