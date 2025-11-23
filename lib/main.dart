import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/academy_list_page/view_model/academy_list_view_model.dart';
import 'features/splash_page/screen/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// GLOBAL VIEW MODELS (App-wide scope)
        ChangeNotifierProvider(
          create: (_) {
            final vm = AcademyViewModel();
            vm.loadProjects();
            return vm;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App Demo",
        theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.white),
        home: SplashPage(),
      ),
    );
  }
}
