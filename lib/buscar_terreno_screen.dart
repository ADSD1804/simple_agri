import 'package:flutter/material.dart';
import 'terreno_model.dart';
import 'terreno_controller.dart';

class BuscarTerrenoScreen extends StatefulWidget {
  @override
  _BuscarTerrenoScreenState createState() => _BuscarTerrenoScreenState();
}

class _BuscarTerrenoScreenState extends State<BuscarTerrenoScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Terreno> _terrenos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Terreno'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Buscar por nombre o código',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _buscarTerrenos, 
                ),
              ),
            ),
          ),
          Expanded(
            child: _buildTerrenoTable(), 
          ),
        ],
      ),
    );
  }

  Widget _buildTerrenoTable() {
    return DataTable(columns: [
      DataColumn(label: Text('Terreno')),
      DataColumn(label: Text('Código')),
      DataColumn(label: Text('Estado')),
      DataColumn(label: Text('Fecha de creación')),
    ], rows: _terrenos.map((terreno) {
      return DataRow(cells: [
        DataCell(Text(terreno.nombre)),
        DataCell(Text(terreno.codigo)),
        DataCell(Text(_getEstado(terreno.status))),
        DataCell(Text(terreno.creationStamp.toLocal().toString())),
      ]);
    }).toList());
  }

  String _getEstado(int status) {
    switch (status) {
      case 0:
        return 'Activo';
      case 1:
        return 'Inactivo';
      case 2:
        return 'Cerrado';
      default:
        return 'Desconocido';
    }
  }

  void _buscarTerrenos() async {
  final query = _searchController.text;
  final terrenos = await TerrenoController().buscarTerrenos(query);
  
  setState(() {
    _terrenos = terrenos; 
  });
}
}
