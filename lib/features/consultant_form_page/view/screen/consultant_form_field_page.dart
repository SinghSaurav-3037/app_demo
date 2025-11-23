import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/constants/app_font_size.dart';
import 'package:flutter_app_demo/core/theme/text_style.dart';
import 'package:flutter_app_demo/features/academy_list_page/view/screen/academy_page.dart';
import 'package:flutter_app_demo/features/consultant_form_page/data/consultant_form_static_list.dart';
import 'package:flutter_app_demo/features/consultant_form_page/model/consultant_field_model.dart';
import 'package:flutter_app_demo/features/consultant_form_page/view/screen/widgets/consultant_form_widget.dart';
import 'package:flutter_app_demo/features/consultant_form_page/view_model/consultant_form_view_model.dart';
import 'package:provider/provider.dart';

class ConsultantFormPage extends StatefulWidget {
  const ConsultantFormPage({super.key});

  @override
  State<ConsultantFormPage> createState() => _ConsultantFormPageState();
}

class _ConsultantFormPageState extends State<ConsultantFormPage> {
  late FormViewModel _formViewModel;

  @override
  void initState() {
    super.initState();
    final fields = consultantFormStaticFormList.map((map) => FormFieldModel.fromMap(map)).toList();
    _formViewModel = FormViewModel(fields);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormViewModel>.value(
      value: _formViewModel,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text("Consultant Form Field",style: boldTextStyle(fontSize: AppFontSize.dp16),),
          actions: [
            IconButton(
              icon: const Icon(Icons.list_alt),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AcademyPage()));
              },
            ),
          ],
        ),
        body: const ConsultantFormWidgetPage(),
      ),
    );
  }
}
