import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/utils/app_color.dart';
import 'package:flutter_app_demo/core/utils/app_font_size.dart';

inputBorderAll(
    {width = 1.0, radius = AppFontSize.cornorRadius,color = CustomColor.borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    borderSide: BorderSide(width: width,color: color),
  );
}

outlineBorderAll(
    {width = 1.0, radius = AppFontSize.cornorRadius,color = CustomColor.borderColor}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    borderSide: BorderSide(width: width,color: color),
  );
}

roundedBorder(
    {radius = AppFontSize.cornorRadius, borderWidth = 1.0,color = CustomColor.borderColor}) {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: BorderSide( width: borderWidth,color: color));
}

boxDecorationCustom(
    {radius = AppFontSize.cornorRadius, borderWidth = 1.0,color = CustomColor.borderColor}) {
  return BoxDecoration(
    border: Border.all( width: borderWidth,color: color),
    borderRadius: BorderRadius.all(
      Radius.circular(radius),),
  );
}
