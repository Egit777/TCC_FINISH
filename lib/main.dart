import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:Minha_Gazoza/Home.dart';
import 'package:Minha_Gazoza/layout.dart';
import 'Database/BancoDados.dart';
import 'telaCalculo.dart';
import 'historico.dart';

const Color darkBlue = Color.fromARGB(255, 255, 255, 255);

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    BancoDados.criarBanco();
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Layout(),
        ),
      ),
    );
  }
}
