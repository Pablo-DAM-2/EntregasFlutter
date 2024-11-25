import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class ContadorClics extends StatelessWidget {
  const ContadorClics({super.key});

  @override
  Widget build(BuildContext context) {
    return const Contador();
  }
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _MiContadorState();
}

class _MiContadorState extends State<Contador> {
  int contador = 0;

  void incrementar() {
    setState(() {
      contador++;
    });
  }

  void decrementar() {
    setState(() {
      contador--;
    });
  }

  void reiniciar() {
    setState(() {
      contador = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de clicks"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Text(
          "Has pulsado $contador veces",
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: incrementar,
            child: const Text("+"),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: decrementar,
            child: const Text("-"),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: reiniciar,
            child: const Text("0"),
          ),
        ],
      ),
    );
  }
}
