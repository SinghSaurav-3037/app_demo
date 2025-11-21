import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/utils/app_font_size.dart';
import 'package:google_fonts/google_fonts.dart';

semiBoldTextStyle({ color = Colors.black, fontSize = AppFontSize.dp14,}){
  return GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color
  );
}

boldTextStyle({ color = Colors.black, fontSize = AppFontSize.dp14}){
  return GoogleFonts.montserrat(
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color
  );
}

regularTextStyle({fontSize = AppFontSize.dp14,fontWeight = FontWeight.w400}){
  return GoogleFonts.montserrat(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: Colors.black
  );
}
