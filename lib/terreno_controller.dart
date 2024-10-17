// lib/terreno_controller.dart
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'terreno_model.dart';

class TerrenoController {
  Future<List<Terreno>> buscarTerrenos(String query) async {
    final url = 'https://dev.simpleagri.com/start.php?&PruebaTecnica&obtener_terrenos';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Terreno> terrenos = data.map((item) => Terreno.fromJson(item)).toList();
      
      return terrenos.where((terreno) {
        return terreno.nombre.contains(query) || terreno.codigo.contains(query);
      }).toList();
    } else {
      throw Exception('Error al cargar terrenos');
    }
  }
}
