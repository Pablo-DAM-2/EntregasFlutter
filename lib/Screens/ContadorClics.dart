import 'package:flutter/material.dart';
import 'package:flutter_tarea01/Screens/MenuLateral.dart';

void main() => runApp(const Contador());

class ContadorClics extends StatelessWidget {
  const ContadorClics({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ContadorClics',
      home: Contador(),
    );
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
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
        title: const Text("Contador de clicks"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white, size: 40),
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
