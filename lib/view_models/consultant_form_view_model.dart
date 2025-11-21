import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/network/api_client.dart';
import 'package:flutter_app_demo/core/utils/formatters.dart';
import 'package:flutter_app_demo/core/utils/logger.dart';
import '../models/consultant_field_model.dart';

class FormViewModel extends ChangeNotifier {
  final List<FormFieldModel> fields;
  Map<String, dynamic> fieldValues = {};
  Map<String, String?> fieldErrors = {};

  FormViewModel(this.fields) {
    // Initialize all fields with empty values
    for (var field in fields) {
      fieldValues[field.key] = '';
      fieldErrors[field.key] = null;
    }
  }

  // Update value of a field
  void setValue(String key, dynamic value) {
    fieldValues[key] = value;
    validateField(key);
    notifyListeners();
  }

  dynamic getValue(String key) => fieldValues[key];

  String? getError(String key) => fieldErrors[key];

  // Validate single field
  bool validateField(String key) {
    final field = fields.firstWhere((f) => f.key == key);
    final value = fieldValues[key]?.toString() ?? '';

    if (field.required && value.isEmpty) {
      fieldErrors[key] = "${field.label} is required";
      return false;
    }

    if (field.validation != null && field.validation!['pattern'] != null) {
      final regex = RegExp(field.validation!['pattern']);
      if (value.isNotEmpty && !regex.hasMatch(value)) {
        fieldErrors[key] = field.validation!['message'];
        return false;
      }
    }

    if (field.validation != null && field.validation!['validateIfNotEmpty'] == true) {
      if (value.isNotEmpty && field.validation!['pattern'] != null) {
        final regex = RegExp(field.validation!['pattern']);
        if (!regex.hasMatch(value)) {
          fieldErrors[key] = field.validation!['message'];
          return false;
        }
      }
    }

    fieldErrors[key] = null;
    return true;
  }

  // Validate all fields
  bool validateAll() {
    bool isValid = true;
    for (var field in fields) {
      if (!validateField(field.key)) isValid = false;
    }
    notifyListeners();
    return isValid;
  }

  // call api on submit button
  Future<void> submitForm() async {
    if (!validateAll()) {
      return;
    }

    // api body
    Map<String, dynamic> apiBody = {
      "mobile_no_alternative": fieldValues['mobile_no_alternative'] ?? '',
      "birth_date": fieldValues['birth_date'] ?? '',
      "category": fieldValues['category'] ?? '',
      "project": fieldValues['project'] ?? '',
      "consultant_project_type": null,
      "consultant_account_holder_name": "",
      "consultant_account_ifsc": "",
      "consultant_account_number": "",
      "consultant_adhaar_number": "",
      "consultant_pan": "",
      "dob": dateFormatter(fieldValues['birth_date']) ?? '',
      "email": fieldValues['email'] ?? '',
      "first_name": fieldValues['full_name'] ?? '',
      "full_name": fieldValues['full_name'] ?? '',
      "gender": fieldValues['gender'] ?? '',
      "language": "en",
      "last_name": "",
      "mobile_no": fieldValues['mobile_no'] ?? '',
      "name": fieldValues['email'] ?? '',
      "password": fieldValues['password'] ?? '',
      "phone": "",
      "project_sub_type": fieldValues['project'] ?? '',
      "username": fieldValues['username'] ?? '',
    };


    var value = await ApiCallMethods.post(
      url: "https://stgtmfapp.dhwaniris.in/api/v2/method/consultant-signup",
      data: apiBody,
    );
    var main = ApiCallMethods.checkResponse(response: value);
    printText("Main respones ${main.message}");
  }
}
