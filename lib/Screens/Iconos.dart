import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Iconos extends StatelessWidget {
  const Iconos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 55, 55),
          title: const Text("Iconos"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 40),
        ),
        drawer: const MenuLateral(),
        backgroundColor: const Color.fromARGB(255, 92, 101, 192),
        body: const Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceAround, // Espacio entre iconos
            children: <Widget>[
              Icon(Icons.home, size: 50, color: Colors.blue),
              Icon(Icons.star, size: 50, color: Colors.amber),
              Icon(Icons.favorite, size: 50, color: Colors.red),
              Icon(Icons.settings, size: 50, color: Colors.grey),
              Icon(Icons.person, size: 50, color: Colors.green),
            ],
          ),
        ));
  }
}
