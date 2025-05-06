import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  const AnimatedCrossFadePage({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadePage> createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  bool _isFade = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Cross Fade'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _isFade = !_isFade; // Alterna entre true y false
              });
            },
            child: const Text(
              'Cambiar',
              style: TextStyle(color: Color(0xff050404)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: AnimatedCrossFade(
              firstChild: Image.network(
                'https://www.w3schools.com/w3images/fjords.jpg', // Imagen de ejemplo (Perro)
                width: 350,
                height: 350,
                fit: BoxFit.cover,
              ),
              secondChild: Image.network(
                'https://www.w3schools.com/w3images/lights.jpg', // Imagen de ejemplo (León)
                width: 350,
                height: 350,
                fit: BoxFit.cover,
              ),
              crossFadeState: _isFade
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(seconds: 1),
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar!'),
            ),
          ),
        ],
      ),
    );
  }
}
