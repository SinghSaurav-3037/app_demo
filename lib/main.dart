import 'package:flutter/material.dart';
import 'package:flutter_app_demo/views/splash_page/splash_page.dart';
import 'package:provider/provider.dart';

import 'view_models/academy_list_view_model.dart';

void main() async {
  // Bind Widgets to flutter engine
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AcademyViewModel>(
          create: (_) {
            final vm = AcademyViewModel();
            vm.loadProjects();
            return vm;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Dynamic Offline Form",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashPage(),
      ),
    );
  }
}
