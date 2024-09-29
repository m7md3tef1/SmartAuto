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
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
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
                    child:   Icon(Icons.logout,size: 30.w,)),
          ],
        ),
      ),
    );
  }
}
