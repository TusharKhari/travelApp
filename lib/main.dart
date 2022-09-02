import 'package:flutter/material.dart';
import 'package:travel_app/pages/navPages/main_page.dart';
import 'package:travel_app/pages/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainPage(),

        //  WelcomePage(),
        );
  }
}
