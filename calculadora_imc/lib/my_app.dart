import 'package:calculadora_imc/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(primarySwatch: Colors.teal, textTheme: GoogleFonts.robotoTextTheme()),
      debugShowCheckedModeBanner: false,
    );
  }
}