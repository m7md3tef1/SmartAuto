import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color_manager/color_manager.dart';
import 'custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  var function;
  String? text;
  double? width;
  double? height;
  var color;
  var colorborder;
  var colortext;
  double? font;
  var icon;
  var image;
  var color2;
  CustomButton(
      {super.key,
      this.color2,
      this.image,
      this.function,
      this.colorborder,
      this.colortext,
      required this.text,
      this.font,
      this.width,
      this.height,
      this.icon,
      this.color});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
          width: width ?? 1.sw,
          height: height ??
              (ScreenUtil().orientation == Orientation.landscape ? 70.h : 65.h),
          decoration: BoxDecoration(
              color: color ?? ColorManager.backgroundColor,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    blurRadius: 0,
                    color: color2 == null
                        ? Colors.transparent
                        : color2.withOpacity(.2)),
              ],
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: colorborder ?? Colors.transparent)),
          child: Center(
              child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil().orientation == Orientation.landscape
                    ? 0.sp
                    : 10.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: CustomText(
                        text: text,
                        align: TextAlign.center,
                        color: colortext ?? Colors.white,
                        fontSize: font ??
                            (ScreenUtil().orientation == Orientation.landscape
                                ? 10.sp
                                : 20.sp),
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ))),
    );
  }
}
