import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/utils/app_font_size.dart';
import 'package:flutter_app_demo/core/utils/border.dart';
import 'package:flutter_app_demo/core/utils/text_style.dart';

inputFieldDecoration(
    String labelText, {
      isMandate = false,
      padding = const EdgeInsets.only(top: 0, bottom: 10, left: 16, right: 16),
      contentPadding = const EdgeInsets.all(10),
      suffixIcon,
      suffixText,
      prefixIcon,
    }) {
  return InputDecoration(
    isDense: true,
    alignLabelWithHint: true,
    contentPadding: contentPadding,
    suffixText: suffixText,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    suffixStyle: regularTextStyle(),
    hintText: labelText,
    counterText: "",
    hintStyle: regularTextStyle(fontSize: AppFontSize.dp12),
    filled: true,
    fillColor: Colors.white,
    border: inputBorderAll(radius: AppFontSize.cornorRadius),
  );
}

dropDownDecoration(
    String labelText, {
      padding = const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 10),
      suffixIcon,
      enabled = true,
    }) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    isDense: true,
    alignLabelWithHint: true,
    contentPadding: padding,
    hintText: labelText,
    counterText: "",
    hintStyle: regularTextStyle(),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: inputBorderAll(),
    focusedBorder: inputBorderAll(width: 2.0),
  );
}

searchBoxDecoration(
    String labelText, {
      padding = const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
    }) {
  return InputDecoration(
    isDense: true,
    alignLabelWithHint: true,
    contentPadding: padding,
    labelText: labelText,
    counterText: "",
    labelStyle: regularTextStyle(fontSize: AppFontSize.dp14),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: inputBorderAll(),
    focusedBorder: inputBorderAll(width: 2.0),
  );
}

dateFieldDecoration(
    String labelText, {
      padding = const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
    }) {
  return InputDecoration(
    isDense: true,
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    hintText: labelText,
    counterText: "",
    hintStyle: regularTextStyle(fontSize: AppFontSize.dp12),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: inputBorderAll(),
    focusedBorder: inputBorderAll(width: 2.0),
  );
}
