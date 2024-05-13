import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.red,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 15),
          side: const BorderSide(
              color: Color.fromARGB(255, 255, 255, 255), width: 2)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      errorBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        textStyle: const TextStyle(
          fontSize: 17,
        ),
        disabledBackgroundColor: Colors.grey,
      ),
    ),
    primarySwatch: Colors.red,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    elevation: 0.0,
    toolbarTextStyle: TextStyle(
      color: Colors.black
    ),
    iconTheme: IconThemeData(color: Colors.black)
    )
    );

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(12)),
  borderSide: BorderSide(color: Colors.grey),
);
