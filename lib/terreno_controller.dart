import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'terreno_model.dart';

class TerrenoController {
  Future<List<Terreno>> buscarTerrenos(String query) async {
    // Cargar el archivo JSON desde los assets
    final String response = await rootBundle.loadString('assets/terrenos.json');
    List<dynamic> data = json.decode(response);
    
    // Convertir los datos JSON en una lista de objetos Terreno
    List<Terreno> terrenos = data.map((item) => Terreno.fromJson(item)).toList();

    // Filtrar los terrenos según la búsqueda
    return terrenos.where((terreno) {
      return terreno.nombre.contains(query) || terreno.codigo.contains(query);
    }).toList();
  }
}
