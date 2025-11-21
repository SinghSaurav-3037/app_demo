import 'package:flutter/material.dart';
import 'package:flutter_app_demo/core/utils/text_style.dart';
import 'package:flutter_app_demo/models/academy_list_model.dart';

class AcademyListItem extends StatelessWidget {
  final AcademyListModel project;

  const AcademyListItem({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   title: Text(
    //     project.projectName,
    //     style: const TextStyle(fontWeight: FontWeight.bold),
    //   ),
    //
    //   subtitle: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text('Code: ${project.name}'),
    //       Text('Type: ${project.projectType}'),
    //       Text('Program: ${project.program}'),
    //       Text('Area: ${project.area}'),
    //       Text('District: ${project.district}'),
    //     ],
    //   ),
    //
    //   trailing: Text(
    //     project.status,
    //     style: const TextStyle(fontWeight: FontWeight.w600),
    //   ),
    // );

    return Card(
      elevation: 0.0,
      // margin: const EdgeInsets.symmetric(horizontal: 12.0),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        title: Text(project.projectName, style: boldTextStyle()),
        subtitle: Text(project.status, style: regularTextStyle()),
        childrenPadding: const EdgeInsets.all(15.0),
        children: [
          // Divider(),
          _fieldView(label: "Name", value: project.name),
          _fieldView(label: "Area", value: project.area),
          _fieldView(label: "District", value: project.district),
          _fieldView(label: "project_type", value: project.projectType),
          _fieldView(label: "program", value: project.program),
        ],
      ),
    );
  }

  _fieldView({required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: semiBoldTextStyle()),
          Expanded(child: Text(value, style: regularTextStyle())),
        ],
      ),
    );
  }
}
