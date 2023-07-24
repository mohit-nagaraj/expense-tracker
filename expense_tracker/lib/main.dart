import 'package:flutter/material.dart';
import 'package:expense_tracker/homescreen.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 105, 72, 183));
var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Color.fromARGB(255, 5, 99, 125));
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                foregroundColor: kDarkColorScheme.onPrimaryContainer,
                side: BorderSide(
                  color: kDarkColorScheme.primaryContainer,
                  width: 2,
                ))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          iconColor: Color.fromARGB(199, 255, 255, 255),
          foregroundColor: Color.fromARGB(185, 255, 255, 255),
        )),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                side: BorderSide(
          color: kColorScheme.primaryContainer,
          width: 2,
        ))),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
          iconColor: Color.fromARGB(180, 0, 0, 0),
          foregroundColor: Color.fromARGB(186, 0, 0, 0),
        )),
      ),
      themeMode: ThemeMode.system,
      //themeMode: ThemeMode.dark,
      //themeMode: ThemeMode.light,
      home: const Expenses(),
    ),
  );
}
