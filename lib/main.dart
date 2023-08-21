import 'package:flutter/material.dart';
import 'package:rick_and_morty/features/presenter/pages/rick_and_morty_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
      ),
      home: RickAndMortyPage(),
    );
  }
}
