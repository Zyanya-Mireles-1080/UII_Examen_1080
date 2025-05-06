import 'package:flutter/material.dart';

class CustomPaintPage extends StatelessWidget {
  const CustomPaintPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.green, // Fondo azul
        title: const Text(
          'custom_paint',
          style: TextStyle(
            color: Colors.white, // Letra blanca
            fontSize: 20.0, // Tamaño de la letra 20
          ),
        ),
        centerTitle: true, // Centrar el texto
      ),
      body: Column(
        children: [
          Expanded(
            // Da altura al Stack para que se vea
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                    width: size.width,
                    height: 80,
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(size.width, 80),
                          painter: BNBCustonPainter(),
                        ),
                        Center(
                          heightFactor: 0.6,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.purple,
                            elevation: 8.0,
                            child: const Icon(Icons.shopping_basket),
                          ),
                        ),
                        SizedBox(
                          width: size.width,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.home),
                                color: Colors.purple,
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.restaurant_menu),
                                color: const Color(0xFFAEAEAE),
                                onPressed: () {},
                              ),
                              SizedBox(width: size.width * 0.20),
                              IconButton(
                                icon: const Icon(Icons.bookmark),
                                color: const Color(0xFFAEAEAE),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.notifications),
                                color: const Color(0xFFAEAEAE),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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

class BNBCustonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 8, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BNBCustonPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BNBCustonPainter oldDelegate) => false;
}
