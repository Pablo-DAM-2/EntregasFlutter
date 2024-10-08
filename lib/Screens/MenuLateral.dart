import 'package:flutter/material.dart';
import 'package:flutter_tarea01/Screens/Iconos.dart';
import 'package:flutter_tarea01/main.dart';
import 'Fila.dart';
import 'Columna.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 115, 120, 130),
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("LionX"),
              accountEmail: Text("pagusal3108@g.educaand.es"),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/relax.jpg"),
                      fit: BoxFit.cover)),
            ),
            Ink(
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white),
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
                leading: Icon(Icons.image, color: Colors.white),
                title: const Text(
                  "Fila",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Fila()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: Icon(Icons.image, color: Colors.white),
                title: const Text(
                  "Columna",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Columna()));
                },
              ),
            ),
            Ink(
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: const Text(
                  "Iconos",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Iconos()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
