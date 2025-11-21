import 'package:flutter/material.dart';
import 'package:flutter_app_demo/views/academy_list_page/widget/academy_list_item.dart';
import 'package:flutter_app_demo/data/static_form_list.dart';
import 'package:flutter_app_demo/models/consultant_field_model.dart';
import 'package:flutter_app_demo/view_models/consultant_form_view_model.dart';
import 'package:flutter_app_demo/views/academy_list_page/academy_page.dart';
import 'package:flutter_app_demo/views/consultan_page/widgets/consultant_form.dart';
import 'package:provider/provider.dart';

class ConsultantFormPage extends StatelessWidget {
  const ConsultantFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FormViewModel(
          staticFormList.map((e) => FormFieldModel.fromMap(e)).toList()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Consultant Form"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AcademyPage()),
            );
          }, icon: Icon(Icons.pages))

        ],),
        body: ConsultantForm(),
      ),
    );
  }
}
