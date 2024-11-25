import 'package:flutter/material.dart';
import 'package:flutter_tarea01/screens/juegoImagenes.dart';
import '../screens/screens.dart';

class AppRoutes {
  // Definir nombres para las rutas
  static const String menuLateral = '/menuLateral';
  static const String fila = '/fila';
  static const String columna = '/columna';
  static const String iconos = '/iconos';
  static const String contadorClics = '/contadorClics';
  static const String juegoImagenes = '/juegoImagenes';
  static const String piramide = '/piramide';
  static const String desafio = '/desafio';

  // Mapa de rutas
  static final Map<String, WidgetBuilder> routes = {
    menuLateral: (context) => const MenuLateral(),
    fila: (context) => const Fila(),
    columna: (context) => const Columna(),
    iconos: (context) => const Iconos(),
    contadorClics: (context) => const ContadorClics(),
    juegoImagenes: (context) => const JuegoImagenes(),
    piramide: (context) => const Piramide(),
    desafio: (context) => const Desafio(),
  };
}
