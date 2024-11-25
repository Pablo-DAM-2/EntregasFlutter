import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Desafio extends StatelessWidget {
  const Desafio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Desafío"),
        ),
        drawer: const MenuLateral(),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 10,
              ),
            ),
            width: 280,
            height: 280,
            alignment: Alignment.center,
            child: const Text(
              'P',
              style: TextStyle(
                fontSize: 180,
                color: Colors.white,
              ),
            ),
          ),
        ));
  }
}
