import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/widgets/custom_text_field.dart';
import 'package:flutter_app_demo/core/theme/app_color.dart';
import 'package:flutter_app_demo/core/constants/app_font_size.dart';
import 'package:flutter_app_demo/core/widgets/common_widget.dart';
import 'package:flutter_app_demo/core/theme/text_style.dart';
import 'package:flutter_app_demo/features/consultant_form_page/view_model/consultant_form_view_model.dart';
import 'package:provider/provider.dart';

class ConsultantFormWidgetPage extends StatelessWidget {
  const ConsultantFormWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormViewModel>(context);

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: viewModel.fields.length + 1, // +1 for submit button
      itemBuilder: (context, index) {
        if (index == viewModel.fields.length) {
          return Padding(
            padding: EdgeInsets.only(bottom: 25.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.primaryColor,
                // shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
              ),
              onPressed: () async {
                await viewModel.submitForm();
              },
              child: Text("Submit", style: semiBoldTextStyle(color: Colors.white)),
            ),
          );
        }

        final field = viewModel.fields[index];
        final error = viewModel.getError(field.key);

        switch (field.type) {
          case 'text':
          case 'password':
          case 'phone':
          case 'email':
            return Padding(
              padding: const EdgeInsets.only(bottom: AppFontSize.dp10),
              child: Column(
                children: [
                  hintText(field.label,isMandate: field.required ? true : false),
                  CustomTextField(
                    hintText: field.label,
                    hideText: field.type == 'password',
                    keyboardType: _getKeyboardType(field.inputType),
                    maxLength: field.maxLength,
                    errorText: error,
                    onChanged: (value) => viewModel.setValue(field.key, value),
                  ),
                ],
              ),
            );

          case 'dropdown':
            return Padding(
              padding: const EdgeInsets.only(bottom: AppFontSize.dp10),
              child: Column(
                children: [
                  hintText(field.label,isMandate: field.required ? true : false),
                  dropDownView<String>(
                    context,
                    field.options!.map((opt) => opt['name'].toString()).toList(),
                    field.label,
                    selected: viewModel.getValue(field.key).isEmpty
                        ? "Select"
                        : viewModel.getValue(field.key),
                    onchange: (value) {
                      final selectedOption = field.options!.firstWhere(
                            (opt) => opt['name'].toString() == value,
                      );

                      viewModel.setValue(field.key, selectedOption['id'].toString());
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty || val == "Select") return error;
                      return null;
                    },
                  ),

                ],
              ),
            );

          case 'date':
            return Padding(
              padding: const EdgeInsets.only(bottom: AppFontSize.dp10),
              child: datePickerView(
                context,
                viewModel.getValue(field.key),
                () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now().subtract(const Duration(days: 365 * 70)),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    viewModel.setValue(field.key, pickedDate.toIso8601String());
                  }
                },
                controller: TextEditingController(
                  text: viewModel.getValue(field.key).toString().isEmpty
                      ? ""
                      : viewModel.getValue(field.key).toString().split('T')[0],
                ),
                isMandate: field.required ? true : false,
                text: field.label,
                readOnly: false,
              ),
            );

          default:
            return SizedBox.shrink();
        }
      },
    );
  }

  TextInputType _getKeyboardType(String? inputType) {
    switch (inputType) {
      case 'textEmailAddress':
        return TextInputType.emailAddress;
      case 'phone':
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }
}
