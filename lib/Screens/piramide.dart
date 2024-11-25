import 'package:flutter/material.dart';
import 'MenuLateral.dart';

class Piramide extends StatelessWidget {
  const Piramide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pirámide"),
      ),
      drawer: const MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 95,
                        height: 95,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(width: 15),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 85,
                        height: 85,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 85,
                        height: 85,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SizedBox(
                        width: 85,
                        height: 85,
                        child: Image.asset("assets/images/john pork.png",
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'John Pork is calling',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
