// Model representing single project item
class AcademyListModel {
  final String projectName;
  final String name;
  final String area;
  final String district;
  final String projectType;
  final String program;
  final String status;

  AcademyListModel({
    required this.projectName,
    required this.name,
    required this.area,
    required this.district,
    required this.projectType,
    required this.program,
    required this.status,
  });

  factory AcademyListModel.fromJson(Map<String, dynamic> json) {
    return AcademyListModel(
      projectName: json['project_name'] ?? '',
      name: json['name'] ?? '',
      area: json['area'] ?? '',
      district: json['district'] ?? '',
      projectType: json['project_type'] ?? '',
      program: json['program'] ?? '',
      status: json['status'] ?? '',
    );
  }

  // to insert in db
  Map<String, dynamic> toJson() {
    return {
      'project_name': projectName,
      'name': name,
      'area': area,
      'district': district,
      'project_type': projectType,
      'program': program,
      'status': status,
    };
  }
}
