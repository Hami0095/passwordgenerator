import 'package:flutter/material.dart';
import 'package:password_generator/themes/themes.dart';

import './models/pwd_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyThemes.darkTheme,
      home: const PasswordGenerator(),
    );
  }
}
