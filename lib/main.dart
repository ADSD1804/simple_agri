import 'package:flutter/material.dart';
import 'buscar_terreno_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscar Terrenos',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BuscarTerrenoScreen(), // Aquí cargamos la pantalla de búsqueda
    );
  }
}
