import 'package:flutter/material.dart';
import 'package:kidvento_task/presentation/resources/route_manager.dart';
import 'package:kidvento_task/presentation/resources/strings_manager.dart';
import 'package:kidvento_task/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;
  const MyApp._internal();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getAppTheme(),
    );
  }
}
