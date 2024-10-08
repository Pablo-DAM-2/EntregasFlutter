import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/MenuLateral.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Página principal',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 55, 55, 55),
            title: const Text("Página principal", selectionColor: Colors.white),
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: const IconThemeData(color: Colors.white, size: 40),
          ),
          drawer: const MenuLateral(),
          backgroundColor: const Color.fromARGB(255, 92, 101, 192),
          body: Center(
            child: Text(
              "Pablo Aguilera Salinas",
              style: GoogleFonts.lobster(fontSize: 40),
            ),
          ),
        ));
  }
}
