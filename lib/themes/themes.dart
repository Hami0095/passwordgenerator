import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black87,
    primarySwatch: Colors.blue,
    dividerColor: Colors.blue,
    cardColor: Colors.black,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
    ),
    switchTheme: SwitchThemeData(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.blue;
          }
          return Colors.white;
        },
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.blue,
        fontFamily: 'Lato',
        fontSize: 20,
      ),
      titleMedium: TextStyle(
        color: Colors.blue,
        fontFamily: 'Lato',
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: Colors.blue,
        fontFamily: 'Lato',
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 15,
      ),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 13,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 15,
      ),
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato-Bold',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato-Bold',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        // fontStyle:
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 11,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 9,
      ),
      labelSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Lato',
        fontSize: 7,
      ),
    ),
    colorScheme: const ColorScheme.dark(
      onPrimary: Colors.blue,
      onError: Colors.red,
      brightness: Brightness.light,
      primary: Colors.lightBlueAccent,
      secondary: Colors.blue,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontFamily: 'lato', color: Colors.white10),
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // textTheme:
    ),
  );
}
