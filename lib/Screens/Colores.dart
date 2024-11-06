import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'MenuLateral.dart';

void main() {
  runApp(const Colores());
}

class Colores extends StatefulWidget {
  const Colores({super.key});

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 55, 55),
          title: const Text("Juego click imágenes"),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(color: Colors.white, size: 40),
        ),
        drawer: const MenuLateral(),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Puntos: $points',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
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
      ),
    );
  }
}
