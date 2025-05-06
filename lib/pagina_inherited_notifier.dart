import 'dart:math' as math;
import 'package:flutter/material.dart';

class SpinModel extends InheritedNotifier<AnimationController> {
  const SpinModel({
    Key? key,
    AnimationController? notifier,
    required Widget child,
  }) : super(key: key, notifier: notifier, child: child);

  static double of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SpinModel>()!
        .notifier!
        .value;
  }
}

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: SpinModel.of(context) * 2.0 * math.pi,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.purple,
        child: const Center(
          child: Text('Whee!', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

class MyInheritedNotifier extends StatefulWidget {
  const MyInheritedNotifier({Key? key}) : super(key: key);

  @override
  State<MyInheritedNotifier> createState() => _MyInheritedNotifierState();
}

class _MyInheritedNotifierState extends State<MyInheritedNotifier>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inherited Notifier'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Botón de regresar
          },
        ),
      ),
      body: Center(
        child: SpinModel(
          notifier: _controller,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Spinner(),
              Spinner(),
              Spinner(),
            ],
          ),
        ),
      ),
    );
  }
}
