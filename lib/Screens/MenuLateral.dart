import 'package:flutter/material.dart';
import 'package:flutter_tarea01/screens/formulario.dart';
import 'package:flutter_tarea01/screens/formularioSwitch.dart';
import 'package:flutter_tarea01/screens/guessNumber.dart';
import 'package:flutter_tarea01/screens/juegoImagenes.dart';
import 'package:flutter_tarea01/screens/sieteymedio.dart';
import '../routes/routes.dart';
import 'package:flutter_tarea01/main.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromARGB(255, 115, 120, 130),
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Pablo Aguilera"),
              accountEmail: Text("pabloaguilerasalinas@gmail.com"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/relax.jpg"),
                      fit: BoxFit.cover)),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.home, color: Colors.white),
                title: const Text(
                  "Principal",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const MyApp()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.image, color: Colors.white),
                title: const Text(
                  "Fila",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.fila);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.image, color: Colors.white),
                title: const Text(
                  "Columna",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.columna);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.star, color: Colors.white),
                title: const Text(
                  "Iconos",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.iconos);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.white),
                title: const Text(
                  "Pirámide",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.piramide);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading:
                    const Icon(Icons.functions_rounded, color: Colors.white),
                title: const Text(
                  "Desafío",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.desafio);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.touch_app, color: Colors.white),
                title: const Text(
                  "Contador Clics",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, AppRoutes.contadorClics);
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.touch_app, color: Colors.white),
                title: const Text(
                  "Juego pulsar imagen",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const JuegoImagenes()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.casino, color: Colors.white),
                title: const Text(
                  "Siete y medio",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const SieteYMedio()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading:
                    const Icon(Icons.check_box_rounded, color: Colors.white),
                title: const Text(
                  "Formulario",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Formulario()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.question_mark_rounded,
                    color: Colors.white),
                title: const Text(
                  "Adivinar Número",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const GuessNumber()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: const Icon(Icons.swap_horizontal_circle_sharp,
                    color: Colors.white),
                title: const Text(
                  "Formulario Switch",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const FormularioSwitch()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
