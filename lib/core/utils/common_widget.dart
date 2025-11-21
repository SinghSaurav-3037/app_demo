import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/utils/app_color.dart';
import 'package:flutter_app_demo/core/utils/app_decoration.dart';
import 'package:flutter_app_demo/core/utils/app_font_size.dart';
import 'package:flutter_app_demo/core/utils/text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';


showToast(String message, {color = CustomColor.primaryColor}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

hintText(text, {isMandate = false, topMargin = 5.0, leftMargin = 16.0}) {
  return Container(
      margin: EdgeInsets.only(top: topMargin, left: leftMargin, right: 16),
      width: double.infinity,
      height: 20,
      child: onlyText(text, isMandate: isMandate));
}

onlyText(text, {isMandate = false}) {
  return RichText(
    overflow: TextOverflow.visible,
    textAlign: TextAlign.start,
    text: TextSpan(children: [
      TextSpan(
        text: text,
        style: regularTextStyle(fontSize: AppFontSize.dp13,fontWeight: FontWeight.w600),
      ),
      TextSpan(
          text: isMandate ? " *" : "",
          style: regularTextStyle(fontSize: AppFontSize.dp14))
    ]),
  );
}

datePickerView(context, date, onTap,
    {controller, text, isEnable = true, isMandate = false, readOnly = false}) {
  return Column(
    children: [
      hintText(text, isMandate: isMandate),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        height: 50,
        child: Stack(
          children: [
            InkWell(
                onTap: () {
                  removeFocus(context);
                  onTap();
                },
                child: IgnorePointer(
                  ignoring: !readOnly,
                  child: TextFormField(
                      style: regularTextStyle(),
                      controller: controller,
                      readOnly: readOnly,
                      decoration: dateFieldDecoration('DD-MM-YYYY')),
                )),
            calenderIcon(isEnable: isEnable)
          ],
        ),
      ),
    ],
  );
}

removeFocus(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}

calenderIcon({isEnable = true}) {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: 8.0),
      child: Icon(
        Icons.calendar_today,
        color: isEnable ? Colors.black : Colors.grey.withAlpha(50),
        size: 20.0,
      ),
    ),
  );
}


/// This builds material date picker in Android
Future<DateTime?> buildMaterialDatePicker(
    BuildContext context, DateTime initDate) async {
  var picked = await showDatePicker(
    context: context,
    initialDate: initDate,
    firstDate: DateTime(2000),
    // firstDate: DateTime.now(),
    lastDate: DateTime(2080),
    builder: (context, child) {
      return Theme(
        data: ThemeData.light(useMaterial3: true),
        child: child!,
      );
    },
  );
  return picked;
}

dropDownView<T>(
    context,
    list,
    text, {
      key,
      isLoaded = true,
      selected,
      onchange,
      color,
      validator,
      showSearchBox = false,
    }) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    height: 50,
    child: DropdownSearch<T>(
      popupProps: PopupProps.menu(
        showSearchBox: showSearchBox,
        fit: FlexFit.loose,
        searchFieldProps: TextFieldProps(
          decoration: PopupPropsSearchBox(),
        ),
      ),
      dropdownBuilder: (context, itemAsString) {
        return spinnerText(itemAsString.toString());
      },
      key: key,
      items: list,
      selectedItem: selected,
      onChanged: (value) {
        removeFocus(context);
        onchange(value);
      },
      validator: validator,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.borderColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: CustomColor.borderColor, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    ),
  );
}

PopupPropsSearchBox() {
  return const InputDecoration(
    border: OutlineInputBorder(),
    isDense: true,
    contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
  );
}

spinnerText(String text, {enabled = true}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 0),
    child: Text(
      text,
      style: regularTextStyle(),
    ),
  );
}




