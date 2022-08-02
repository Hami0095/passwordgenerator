import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:password_generator/pages/home_page.dart';
import 'package:password_generator/pages/signin_page.dart';

import './themes/themes.dart';
import './models/pwd_generator.dart';
import './pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PasswordManager',
        theme: MyThemes.darkTheme,
        home: const HomePage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
          SignUpPage.routeName: (ctx) => const SignUpPage(),
          SignInPage.routeName: (ctx) => const SignInPage(),
        });
  }
}
