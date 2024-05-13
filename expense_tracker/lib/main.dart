import 'package:expense_tracker/widgets/expenses.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 222, 243, 237));

var kDarkColorScheme = 
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 121, 125, 5),brightness: Brightness.dark);
void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn){
    runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme().copyWith(
          color : kDarkColorScheme.secondaryContainer,
          // color: const Color.fromARGB(255, 174, 220, 254),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: kDarkColorScheme.primaryContainer,
        foregroundColor: kDarkColorScheme.onPrimaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      // scaffoldBackgroundColor: const Color.fromARGB(255, 222, 243, 237),
      colorScheme: kColorScheme,
      cardTheme: const CardTheme().copyWith(
        // color : kColorScheme.secondaryContainer,
          color: const Color.fromARGB(255, 174, 220, 254),
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
      appBarTheme: const AppBarTheme().copyWith(
        // backgroundColor: kColorScheme.onPrimaryContainer,
        // foregroundColor: kColorScheme.primaryContainer,
        backgroundColor: const Color.fromARGB(255, 17, 75, 95),
        foregroundColor: const Color.fromARGB(255, 228, 253, 225),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(backgroundColor: kColorScheme.primaryContainer),
      ),
      // textTheme: ThemeData().textTheme.copyWith(
      //   titleLarge: TextStyle(fontSize: 30),
      // )
      textTheme: ThemeData().textTheme.copyWith(
        titleMedium: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.black),
      ),
    ),
    // themeMode: ThemeMode.system ,
    home: const Expenses(),
  ));
  // });
  
}
