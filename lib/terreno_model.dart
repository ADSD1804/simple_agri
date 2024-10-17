// lib/terreno_model.dart
class Terreno {
  final String nombre;
  final String codigo;
  final int status;
  final DateTime creationStamp;

  Terreno({required this.nombre, required this.codigo, required this.status, required this.creationStamp});

  factory Terreno.fromJson(Map<String, dynamic> json) {
    return Terreno(
      nombre: json['terrain'],
      codigo: json['crop'],
      status: json['status'],
      creationStamp: DateTime.parse(json['creation_stamp']),
    );
  }
}
