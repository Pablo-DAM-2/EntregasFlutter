import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Iconos extends StatelessWidget {
  const Iconos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Iconos"),
        ),
        drawer: const MenuLateral(),
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
