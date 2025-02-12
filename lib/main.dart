import 'package:flutter/material.dart';
import 'package:recipemanage/screens/recipes.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255,203,35,35),
  );


void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme(
          color: kColorScheme.primary,
        ),
      ),
      home: Recipes(),
    )
  );
}

