import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Columna extends StatelessWidget {
  const Columna({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 55, 55),
          title: const Text("Fotos en columna"),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                    "https://picfiles.alphacoders.com/369/thumb-1920-369582.jpg"),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                    "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2019/08/mike-ehrmantraut-breaking-bad.jpg?tf=3840x"),
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: Image.network(
                    "https://static.eldiario.es/clip/f775ee5b-67f9-41de-b9a3-b904cfc04f7b_16-9-aspect-ratio_default_0.jpg"),
              ),
            ],
          ),
        ));
  }
}
