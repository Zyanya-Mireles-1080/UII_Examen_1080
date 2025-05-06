import 'package:flutter/material.dart';

class CascadeOperatorPage extends StatelessWidget {
  const CascadeOperatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cascade Operator
    User user1 = User()
      ..name = 'User1'
      ..age = 13
      ..changeName();

    // No Cascade Operator
    User user2 = User();
    user2.name = 'User2';
    user2.age = 20;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cascade Operator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Botón de regresar
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.deepPurple[100],
                  child: const Text(
                    '''             User user1 = User()
                    ..name = 'User1'
                    ..age = 13
                    ..changeName();''',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Name: ${user1.name}',
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  "Age: ${user1.age.toString()}",
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(height: 20),
                Text(
                  'Name: ${user2.name}',
                  style: const TextStyle(fontSize: 25),
                ),
                Text(
                  "Age: ${user2.age.toString()}",
                  style: const TextStyle(fontSize: 25),
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

class User {
  String name = '';
  int age = 0;

  String changeName() => name = 'Peter';
}
