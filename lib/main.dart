import 'package:flutter/material.dart';
import 'package:uii_examen_1080/PantallaInicial.dart';
import 'package:uii_examen_1080/pagina_TabBar.dart';
import 'package:uii_examen_1080/pagina_time_picker.dart';
import 'package:uii_examen_1080/pagina_cutom_paint.dart';
import 'package:uii_examen_1080/pagina_dropdown_pop.dart';
import 'package:uii_examen_1080/pagina_animated_crossfade.dart';
import 'package:uii_examen_1080/pagina_align.dart';
import 'package:uii_examen_1080/pagina_cascadeoperator.dart';
import 'package:uii_examen_1080/pagina_inherited_notifier.dart';

void main() => runApp(const MiRutas());

class MiRutas extends StatelessWidget {
  const MiRutas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutas entre páginas',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const PantallaInicial(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/pantalla1': (context) => const TabBarPage(),
        '/pantalla2': (context) => const TimePickerPage(),
        '/pantalla3': (context) => const CustomPaintPage(),
        '/pantalla4': (context) => const DropDownPage(),
        '/pantalla5': (context) => const AnimatedCrossFadePage(),
        '/pantalla6': (context) => const AlignPage(),
        '/pantalla7': (context) => const CascadeOperatorPage(),
        '/pantalla8': (context) => const MyInheritedNotifier(),
      },
    );
  }
}
