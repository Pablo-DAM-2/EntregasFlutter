import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Fila extends StatelessWidget {
  const Fila({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Fotos en fila"),
        ),
        drawer: const MenuLateral(),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    "https://picfiles.alphacoders.com/369/thumb-1920-369582.jpg"),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    "https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2019/08/mike-ehrmantraut-breaking-bad.jpg?tf=3840x"),
              ),
              SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                    "https://static.eldiario.es/clip/f775ee5b-67f9-41de-b9a3-b904cfc04f7b_16-9-aspect-ratio_default_0.jpg"),
              ),
            ],
          ),
        ));
  }
}
