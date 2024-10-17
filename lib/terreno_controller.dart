import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'terreno_model.dart';

class TerrenoController {
  Future<List<Terreno>> buscarTerrenos(String query) async {
    try {
      final String response = await rootBundle.loadString('../assets/terrenos.json');
      print("JSON Cargado: $response"); 
      List<dynamic> data = json.decode(response);

      List<Terreno> terrenos = data.map((item) => Terreno.fromJson(item)).toList();

      return terrenos.where((terreno) {
        return terreno.nombre.contains(query) || terreno.codigo.contains(query);
      }).toList();
    } catch (e) {
      print("Error al cargar el JSON: $e");
      return [];
    }
  }
}
