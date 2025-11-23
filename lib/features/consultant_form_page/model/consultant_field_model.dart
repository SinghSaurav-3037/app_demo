class FormFieldModel {
  final String key;
  final String label;
  final String type;
  final bool required;
  final int? maxLength;
  final int? minLength;
  final String? inputType;
  final String? allowedCharacters;
  final Map<String, dynamic>? validation;
  final List<Map<String, dynamic>>? options;
  final Map<String, dynamic>? datePickerConfig;
  final bool? requiresOTP;

  FormFieldModel({
    required this.key,
    required this.label,
    required this.type,
    required this.required,
    this.maxLength,
    this.minLength,
    this.inputType,
    this.allowedCharacters,
    this.validation,
    this.options,
    this.datePickerConfig,
    this.requiresOTP,
  });

  factory FormFieldModel.fromMap(Map<String, dynamic> map) {
    return FormFieldModel(
      key: map['key'],
      label: map['label'],
      type: map['type'],
      required: map['required'] ?? false,
      maxLength: map['maxLength'],
      minLength: map['minLength'],
      inputType: map['inputType'],
      allowedCharacters: map['allowedCharacters'],
      validation: map['validation'],
      options: map['options'] != null ? List<Map<String, dynamic>>.from(map['options']) : null,
      datePickerConfig: map['datePickerConfig'],
      requiresOTP: map['requiresOTP'],
    );
  }
}
