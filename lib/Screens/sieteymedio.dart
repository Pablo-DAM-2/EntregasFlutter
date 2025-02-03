import 'package:flutter/material.dart';
import 'dart:math';
import 'MenuLateral.dart';

class SieteYMedio extends StatefulWidget {
  const SieteYMedio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _JuegoSieteYMedioState createState() => _JuegoSieteYMedioState();
}

class _JuegoSieteYMedioState extends State<SieteYMedio> {
  double puntosJugador = 0;
  double puntosMaquina = 0;
  String mensaje = "";
  List<double> mazo = [];
  List<double> cartasJugador = [];
  List<double> cartasMaquina = [];
  bool jugadorPlantado = false;
  bool maquinaPlantada = false;
  int victoriasJugador = 0;
  int victoriasMaquina = 0;
  bool partidaTerminada = false;

  @override
  void initState() {
    super.initState();
    _iniciarJuego();
  }

  //Se inicializa el juego reseteando las variables
  void _iniciarJuego() {
    setState(() {
      if (partidaTerminada) {
        victoriasJugador = 0;
        victoriasMaquina = 0;
        partidaTerminada = false;
      }
      puntosJugador = 0;
      puntosMaquina = 0;
      cartasJugador = [];
      cartasMaquina = [];

      mensaje = "";
      _crearMazo();
      _barajarMazo();
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        double cartaMaquina = obtenerCarta();
        cartasMaquina.add(cartaMaquina);
        puntosMaquina += cartaMaquina;

        double cartaJugador = obtenerCarta();
        cartasJugador.add(cartaJugador);
        puntosJugador += cartaJugador;

        jugadorPlantado = false;
        maquinaPlantada = false;
      });
    });
  }

  //Crea el mazo
  void _crearMazo() {
    List<double> cartas = [
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      0.5,
      0.5,
      0.5,
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      0.5,
      0.5,
      0.5,
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      0.5,
      0.5,
      0.5,
      1.0,
      2.0,
      3.0,
      4.0,
      5.0,
      6.0,
      7.0,
      0.5,
      0.5,
      0.5,
    ];
    mazo = List.from(cartas);
  }

  //Baraja el mazo
  void _barajarMazo() {
    mazo.shuffle();
  }

  //Coje la primera carta del mazo
  double obtenerCarta() {
    if (mazo.isNotEmpty) {
      return mazo.removeAt(0);
    }
    return 0.0;
  }

  //El jugador pide carta
  void pedirCartaJugador() {
    double carta = obtenerCarta();
    setState(() {
      if (carta != 0.0) {
        cartasJugador.add(carta);
        puntosJugador += carta;
        if (puntosJugador > 7.5) {
          plantarse();
        }
      }
    });
  }

  //La maquina pide carta
  void pedirCartaMaquina() {
    if (!maquinaPlantada) {
      double carta = obtenerCarta();
      setState(() {
        if (carta != 0.0) {
          cartasMaquina.add(carta);
          puntosMaquina += carta;
          if (puntosMaquina > 7.5) {
            maquinaPlantada = true;
            setState(() {
              verificarGanador();
            });
          } else {
            //Espera un segundo cada vez que pide carta
            Future.delayed(const Duration(seconds: 1), estrategiaMaquina);
          }
        }
      });
    }
  }

  //La inteligencia de la máquina y el funcionamiento en su turno
  void estrategiaMaquina() {
    if (puntosJugador > 7.5) {
      setState(() {
        maquinaPlantada = true;
        mensaje = "La banca se planta";
        verificarGanador();
      });
    } else if (puntosJugador > puntosMaquina && puntosJugador <= 7.5) {
      setState(() {
        pedirCartaMaquina();
      });
    } else if (puntosMaquina >= 6.0) {
      setState(() {
        maquinaPlantada = true;
        mensaje = "La banca se planta";
        verificarGanador();
      });
    } else if (puntosMaquina > puntosJugador) {
      setState(() {
        maquinaPlantada = true;
        mensaje = "La banca se planta";
        verificarGanador();
      });
    } else if (puntosMaquina == 5.5) {
      if (Random().nextDouble() * 4 != 0) {
        setState(() {
          maquinaPlantada = true;
          mensaje = "La banca se planta";
          verificarGanador();
        });
      } else {
        pedirCartaMaquina();
      }
    } else {
      pedirCartaMaquina();
    }
  }

  //Termina el turno del jugador
  void plantarse() {
    setState(() {
      if (puntosJugador <= 7.5) {
        jugadorPlantado = true;
        mensaje = "Te has plantado con $puntosJugador puntos";
      } else {
        jugadorPlantado = true;
        mensaje = "Te has pasado con $puntosJugador puntos";
      }
    });
    //Espera un segundo
    Future.delayed(const Duration(seconds: 1), () {
      estrategiaMaquina();
    });
  }

  //Comprueba los puntos para ver quien gana
  void verificarGanador() {
    if (puntosJugador > 7.5 && puntosMaquina > 7.5) {
      mensaje = "Empate. Ambos jugadores se han pasado.";
    } else if (puntosJugador > 7.5) {
      mensaje = "Te has pasado, la banca gana";
      victoriasMaquina++;
    } else if (puntosMaquina > 7.5) {
      mensaje = "La banca se ha pasado, tú ganas";
      victoriasJugador++;
    } else if (puntosJugador > puntosMaquina) {
      mensaje = "Tienes más puntos que la banca, tú ganas";
      victoriasJugador++;
    } else if (puntosJugador < puntosMaquina) {
      mensaje = "La banca tiene más puntos que tú, has perdido";
      victoriasMaquina++;
    } else {
      mensaje = "Empate. Ambos jugadores tienen los mismos puntos";
    }
    if (victoriasJugador >= 5 || victoriasMaquina >= 5) {
      partidaTerminada = true;
      mensaje = victoriasJugador >= 5
          ? "Enhorabuena makina has ganao"
          : "La banca ta ganao parguela";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Siete y Medio'),
      ),
      drawer: const MenuLateral(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            //Puntos de la máquina
            const Text(
              'Banca: ',
              style: TextStyle(fontSize: 24),
            ),
            //Cartas de la máquina
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cartasMaquina.map((carta) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text(carta.toString())),
                );
              }).toList(),
            ),
            Text(
              'Puntos: $puntosMaquina',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Partidas: $victoriasMaquina',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            //Puntos del jugador
            const Text(
              'Jugador: ',
              style: TextStyle(fontSize: 24),
            ),
            //Cartas del jugador
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: cartasJugador.map((carta) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Chip(label: Text(carta.toString())),
                );
              }).toList(),
            ),
            Text(
              'Puntos: $puntosJugador',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Partidas: $victoriasJugador',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            //Mensaje del resultado
            if (mensaje.isNotEmpty)
              Text(
                mensaje,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            //Botón para pedir carta
            ElevatedButton(
              onPressed: jugadorPlantado || mensaje.isNotEmpty
                  ? null
                  : () {
                      pedirCartaJugador();
                    },
              child: const Text('Pedir Carta'),
            ),
            //Botón para plantarse
            ElevatedButton(
              onPressed: jugadorPlantado || mensaje.isNotEmpty
                  ? null
                  : () {
                      plantarse();
                    },
              child: const Text('Plantarse'),
            ),
            //Botón para reiniciar la partida
            ElevatedButton(
              onPressed: mensaje.isEmpty
                  ? null
                  : () {
                      _iniciarJuego();
                    },
              child:
                  Text(partidaTerminada ? 'Reiniciar Partida' : 'Nueva ronda'),
            )
          ],
        ),
      ),
    );
  }
}
