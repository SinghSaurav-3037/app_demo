import 'package:flutter/material.dart';
import 'package:flutter_app_demo/views/academy_list_page/widget/academy_list_item.dart';
import 'package:provider/provider.dart';
import '../../view_models/academy_list_view_model.dart';

class AcademyPage extends StatelessWidget {
  const AcademyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academy List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // refresh list
              Provider.of<AcademyViewModel>(context, listen: false).refresh();
            },
          )
        ],
      ),
      body: Consumer<AcademyViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.state == LoadState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (viewModel.state == LoadState.error) {
            return Center(child: Text('Error: ${viewModel.errorMessage}'));
          } else if (viewModel.projects.isEmpty) {
            return Center(child: Text('No projects found'));
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.refresh(),
            child: ListView.separated(
              itemCount: viewModel.projects.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, idx) => AcademyListItem(project: viewModel.projects[idx]),
            ),
          );
        },
      ),
    );
  }
}
