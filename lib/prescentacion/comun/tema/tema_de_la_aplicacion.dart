import 'package:flutter/material.dart';

class TemaDeLaAplicacion {
  static const colorPrincipalDeLosComponentes = Color.fromARGB(255, 7, 80, 59);
  ThemeData obtenerTema() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorPrincipalDeLosComponentes,
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: colorPrincipalDeLosComponentes,
          centerTitle: true,
        ),
        listTileTheme: ListTileThemeData(
          tileColor: colorPrincipalDeLosComponentes,
          contentPadding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
