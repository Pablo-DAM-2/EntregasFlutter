import 'package:flutter/material.dart';
import 'dart:math';
import 'MenuLateral.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GuessNumberState createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  late int _targetNumber; // Número objetivo
  String _feedbackMessage = ''; // Mensaje de retroalimentación

  @override
  void initState() {
    super.initState();
    _generateRandomNumber();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // Generar un número aleatorio entre 1 y 100
  void _generateRandomNumber() {
    final random = Random();
    _targetNumber = random.nextInt(100) + 1;
  }

  void _validateGuess() {
    final userInput = int.tryParse(_textController.text);
    if (userInput == null) {
      setState(() {
        _feedbackMessage = 'Por favor, ingresa un número válido.';
      });
      return;
    }

    if (userInput < _targetNumber) {
      setState(() {
        _feedbackMessage = 'El número es mayor. ¡Sigue intentando!';
      });
    } else if (userInput > _targetNumber) {
      setState(() {
        _feedbackMessage = 'El número es menor. ¡Sigue intentando!';
      });
    } else {
      setState(() {
        _feedbackMessage = '¡Felicidades! Adivinaste el número $_targetNumber.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adivina el Número'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Adivina un número entre 1 y 100:',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Escribe tu nombre',
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 255, 136, 0)),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 136, 0), width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Este campo no puede estar vacío.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, introduce un número válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _validateGuess();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 136, 0),
                ),
                child: const Text('Comprobar',
                    style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 16.0),
              Text(
                _feedbackMessage,
                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _generateRandomNumber();
                    _textController.clear();
                    _feedbackMessage =
                        '¡Nuevo juego! Intenta adivinar el número.';
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 136, 0),
                ),
                child: const Text('Reiniciar Juego',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
