import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const ocMaroon = Color.fromARGB(255, 129, 20, 41);
  static const ocDarkMaroon = Color.fromARGB(255, 72, 17, 28);
  static const ocWhite = Colors.white;
  static const iconThemeData = IconThemeData(color: ocWhite);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ocMaroon,
          secondary: ocDarkMaroon,
        ),
        iconTheme: iconThemeData,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: ocWhite,
        ),

        scaffoldBackgroundColor: ocMaroon,

        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: ocWhite,
        ),
        // primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
