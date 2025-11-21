import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_demo/core/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {

  final String? hintText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofill;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool hideText;
  final bool readOnly;
  final bool enabled;
  final int? maxLength;
  final String? errorText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autoValidateMode;

  const CustomTextField({
    Key? key,
    this.hintText,
    this.keyboardType,
    this.autofill,
    this.prefixWidget,
    this.hideText = false,
    this.readOnly = false,
    this.maxLength,
    this.suffixWidget,
    this.enabled = true,
    this.errorText,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.autoValidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: hideText,
        readOnly: readOnly,
        enabled: enabled,
        autovalidateMode: autoValidateMode,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        keyboardType: keyboardType,
        autofillHints: autofill,
        cursorColor: Colors.black,
        cursorHeight: 18.0,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          counterText: '',
          errorText: errorText,
          prefixIcon: prefixWidget,
          suffixIcon: suffixWidget,

          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          filled: true,
          fillColor: readOnly ? Colors.black12 : Colors.white,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFFd4f0ff)),
            borderRadius: BorderRadius.circular(9),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.primaryColor),
            borderRadius: BorderRadius.circular(9),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.withOpacity(.5)),
            borderRadius: BorderRadius.circular(9),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade400),
            borderRadius: BorderRadius.circular(9),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade600),
            borderRadius: BorderRadius.circular(9),
          ),

          hintText: hintText,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 13,
            color: const Color(0xFF77869E),
          ),
        ),
      ),
    );
  }
}
