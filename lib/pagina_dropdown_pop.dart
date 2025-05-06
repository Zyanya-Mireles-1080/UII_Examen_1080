import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  const DropDownPage({Key? key}) : super(key: key);

  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  final _currencies = [
    'Taka (৳)',
    'Dollar (\$)',
    'Euro (€)',
    'Pounds (£)',
    'Yen (¥)',
    'Otros',
  ];
  String _currentItemSelected = 'Taka (৳)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text('Dropdown & PopupMenu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // ← regresa a la página principal
          },
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.arrow_drop_down_circle),
            onSelected: (item) => onSelected(context, item),
            offset: Offset.fromDirection(-14, -50),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: const [
                    Icon(Icons.settings, color: Colors.black38),
                    SizedBox(width: 4.0),
                    Text('Ajustes'),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: const [
                    Icon(Icons.share, color: Colors.black38),
                    SizedBox(width: 4.0),
                    Text('Compartir'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 2,
                child: Row(
                  children: const [
                    Icon(Icons.logout, color: Colors.black38),
                    SizedBox(width: 4.0),
                    Text('Salir'),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 60,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const ListTile(
              title: Text('Haga clic en el botón de menú en AppBar'),
              trailing: Icon(Icons.arrow_upward_rounded),
            ),
          ),
          const SizedBox(height: 20),
          dropdownButton(),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SettingPage()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SharePage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const SigninPage()));
        break;
    }
  }

  Container dropdownButton() {
    return Container(
      height: 70,
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        leading: const Text(
          'Seleccione una: ',
          style: TextStyle(fontSize: 18),
        ),
        title: DropdownButton<String>(
          items: _currencies.map((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (newValueSelected) {
            setState(() {
              _currentItemSelected = newValueSelected.toString();
            });
          },
          value: _currentItemSelected,
        ),
      ),
    );
  }
}

// Páginas auxiliares (sin cambios)

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Ajustes'), backgroundColor: Colors.teal),
      body: Center(
        child: Icon(Icons.settings, color: Colors.grey[350], size: 200),
      ),
    );
  }
}

class SharePage extends StatelessWidget {
  const SharePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Compartir'), backgroundColor: Colors.pinkAccent),
      body: Center(
        child: Icon(Icons.share, color: Colors.grey[350], size: 200),
      ),
    );
  }
}

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Iniciar Sesión'), backgroundColor: Colors.orange),
      body: Center(
        child: Icon(Icons.login, color: Colors.grey[350], size: 200),
      ),
    );
  }
}
