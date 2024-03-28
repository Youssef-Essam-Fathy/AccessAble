import 'package:accessable/presentation/theme_manager.dart';
import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../shared/resources/routes_manager.dart';

class MyApp extends StatefulWidget {

  //Named constructor
  MyApp._internal();
  static final MyApp _instance = MyApp._internal(); // Singleton or single instance

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   int appState = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRout,
      home: const SplashPage(),

    );
  }
}
