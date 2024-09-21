import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField2 extends StatefulWidget {
  var label;
  var icondata;
  var suffix;
  var hint;
  var height;
  var style;
  var title;
  var lines;
  var auto;
  var secure;
  var colorBorder;
  var inputFormatters;
  var enable;
  var TextInputAction;
  var iS = true;
  var iN = false;
  var Dir = false;
  Function(String)? onSubmit;
  var type;
  var border;
  void Function(String?)? onsaved;
  void Function(String?)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CustomTextFormField2({
    super.key,
    this.onSubmit,
    this.height,
    this.type,
    this.hint,
    this.style,
    this.title,
    this.controller,
    this.onChanged,
    this.label,
    this.icondata,
    this.secure,
    this.colorBorder,
    this.onsaved,
    this.validator,
    this.lines,
    this.auto,
    this.inputFormatters,
    this.enable,
    this.TextInputAction,
    this.suffix,
    this.border,
    this.iS = true,
    this.iN = false,
    this.Dir = false,
  });
  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextFormField2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.Dir == false
            ? TextFormField(
                inputFormatters: widget.inputFormatters,
                enabled: widget.enable,
                controller: widget.controller,
                onSaved: widget.onsaved,
                validator: widget.validator,
                onFieldSubmitted: widget.onSubmit,
                obscureText: widget.secure!,
                obscuringCharacter: '*',
                textInputAction: widget.TextInputAction,
                keyboardType: widget.type,
                onChanged: widget.onChanged,
                maxLines: widget.lines ?? 1,
                autovalidateMode: widget.auto,
                style: TextStyle(
                    fontFamily: 'tj',
                    color: const Color(0xFF2E2B2B),
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().orientation == Orientation.landscape
                        ? 8.sp
                        : 16.sp),
                decoration: InputDecoration(
                    errorStyle: TextStyle(
                        fontFamily: 'tj',
                        color: Colors.red,
                        fontSize: ScreenUtil().orientation == Orientation.landscape
                            ? 10.sp
                            : 12.sp),
                    contentPadding:
                        const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 12.0),
                    label: Text(widget.title,
                        style: widget.style ??
                            TextStyle(
                                fontFamily: 'tj',
                                color: widget.colorBorder ?? Colors.black54,
                                fontSize: ScreenUtil().orientation == Orientation.landscape
                                    ? 8.sp
                                    : 16.sp,
                                fontWeight: FontWeight.w500)),
                    hintText: widget.hint,
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: widget.suffix,
                    prefixIcon: widget.icondata,
                    enabledBorder: widget.border ??
                        const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                    border: widget.border ??
                        OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black, width: .1.w, style: BorderStyle.solid)),
                    suffixIconColor: Colors.black))
            : Directionality(
                textDirection: TextDirection.ltr,
                child: TextFormField(
                    inputFormatters: widget.inputFormatters,
                    enabled: widget.enable,
                    controller: widget.controller,
                    onSaved: widget.onsaved,
                    validator: widget.validator,
                    onFieldSubmitted: widget.onSubmit,
                    obscureText: widget.secure!,
                    obscuringCharacter: '*',
                    keyboardType: widget.type,
                    onChanged: widget.onChanged,
                    maxLines: widget.lines ?? 1,
                    style: TextStyle(
                        fontFamily: 'tj',
                        color: const Color(0xFF2E2B2B),
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().orientation == Orientation.landscape
                            ? 8.sp
                            : 15.sp),
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            fontFamily: 'tj',
                            color: Colors.red,
                            fontSize: ScreenUtil().orientation == Orientation.landscape
                                ? 10.sp
                                : 12.sp),
                        contentPadding:
                            const EdgeInsets.fromLTRB(0.0, 12.0, 20.0, 12.0),
                        label: Text(widget.title,
                            style: widget.style ??
                                TextStyle(
                                    fontFamily: 'tj',
                                    color: Colors.black,
                                    fontSize: ScreenUtil().orientation ==
                                            Orientation.landscape
                                        ? 8.sp
                                        : 14.sp,
                                    fontWeight: FontWeight.w400)),
                        hintText: widget.hint,
                        suffixIcon: widget.suffix,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFD6D6D6))),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: const Color(0xFFD6D6D6), width: .1.w, style: BorderStyle.solid)),
                        suffixIconColor: const Color(0xFFD6D6D6))),
              ),
      ],
    );
  }
}
