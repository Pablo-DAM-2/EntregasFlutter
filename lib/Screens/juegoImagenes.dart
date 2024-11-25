import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'MenuLateral.dart';

class JuegoImagenes extends StatefulWidget {
  const JuegoImagenes({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomImages createState() => _RandomImages();
}

class _RandomImages extends State {
  int points = 0;
  final random = Random();
  late Timer _timer = Timer(Duration.zero, () {});
  var images = [
    "assets/images/phone.png",
    "assets/images/joker.png",
    "assets/images/john pork.png"
  ];
  String mensaje = "";

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    resetTimer();
  }

  void resetTimer() {
    _timer.cancel();

    _timer = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        points -= 2;
        _mostrarMensaje();
      });
      resetTimer();
    });
  }

  String getRandomImage() {
    int randomIndex = random.nextInt(images.length);
    return images[randomIndex];
  }

  double getRandomWidth() {
    double width = MediaQuery.of(context).size.width - 100;
    return random.nextDouble() * width;
  }

  double getRandomHeigth() {
    double heigth = MediaQuery.of(context).size.height - 100;
    return random.nextDouble() * heigth;
  }

  void onPhotoTap() {
    points++;
    resetTimer();
    setState(() {
      _mostrarMensaje();
    });
  }

  void _mostrarMensaje() {
    if (points > 0 && points < 20) {
      mensaje = "¡Vas bomba, sigue así!";
    } else if (points >= 20) {
      mensaje = "¡Perfecto, eres el AS!";
    } else if (points < 0) {
      mensaje = "Métele caña primo que estás en negativo";
    } else {
      mensaje = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego click imágenes"),
      ),
      drawer: const MenuLateral(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Puntos: $points',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    mensaje,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: getRandomWidth(),
            top: getRandomHeigth(),
            child: GestureDetector(
              onTap: () {
                onPhotoTap();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  width: 85,
                  height: 85,
                  child: Image.asset(getRandomImage(), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
