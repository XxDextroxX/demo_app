import 'package:flutter/material.dart';

// const seedColor = Color.fromARGB(255, 7, 80, 59);
const seedColor = Color(0xFF01579B);

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        listTileTheme: const ListTileThemeData(
          iconColor: seedColor,
        ),
        // primaryColor: const Color(0xFF01579B), // azul oscuro
        scaffoldBackgroundColor: const Color(0xFFFFFFFF), // blanco
        appBarTheme: const AppBarTheme(
          color: seedColor,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF00BCD4), // turquesa
        ),
      );
}
