import 'package:departments/shared/constant/color.dart';
import 'package:departments/shared/constant/constant.dart';
import 'package:departments/shared/constant/font_style.dart';
import 'package:flutter/material.dart';

Widget textFormField({
  GestureTapCallback? onTap,
  TextEditingController? controller,
  TextInputType? textInputType,
  FormFieldValidator<String>? validate,
  bool obscureText = false,
  FloatingLabelBehavior? floatingLabelBehavior,
  String? labelText,
  Widget? prefixIcon,
  Widget? suffixIcon,
  InputBorder? border,
  String? initValue,
  VoidCallback? onPressed,
  bool enabled = true,
  TextInputAction? action = TextInputAction.next,
  Function(String)? onChanged,
}) =>
    TextFormField(
      textInputAction: action,
      enabled: enabled,
      initialValue: initValue,
      cursorColor: lightBlue,
      onTap: onTap,
      controller: controller,
      keyboardType: textInputType,
      validator: validate,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          contentPadding: EdgeInsets.only(left: size.width * 15 / 375),
          labelText: labelText,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2, color: lightBlue),
          ),
          disabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 2, color: red),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(width: 1, color: grey),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: suffixIcon ?? Container(),
          )),
    );
