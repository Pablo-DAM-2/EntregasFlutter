import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/MenuLateral.dart';
import 'routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Página principal',
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 55, 55, 55),
          scaffoldBackgroundColor: const Color.fromARGB(255, 92, 101, 192),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 55, 55, 55),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            iconTheme: IconThemeData(color: Colors.white, size: 40),
          )),
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
      ),
      routes: AppRoutes.routes,
    );
  }
}
