import 'package:flutter_app_demo/core/utils/common_widget.dart';

class MainResponseModel {
  dynamic status;
  dynamic message;
  dynamic data;

  MainResponseModel({this.status, this.message,this.data});

  // factory MainResponseModel.fromJson(Map<String, dynamic> json) {
  //   print("saurav mainResponse json :${json["data"]} && ${json["status"]} && ${json["message"]}");
  //  return MainResponseModel(
  //       status: json['status'] ?? "",
  //       message: json['message'] ?? "",
  //       data: json['data'] ?? []
  //   );
  // }
  factory MainResponseModel.fromJson(Map<String, dynamic> json) {
    final jsonData = json['data'] ?? {};


    print("saurav mainResponse inner : ${jsonData['status']} && ${jsonData['message']}");

    return MainResponseModel(
        status: jsonData['status'] ?? "",
        message: jsonData['message'] ?? "",
        data: jsonData
    );
  }


}
