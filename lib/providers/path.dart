import 'package:flutter/foundation.dart';

class Path with ChangeNotifier {
  final int id;
  final int dias;
  final DateTime ingreso;
  final String titulo;
  final String subtitulo;
  final String imagen;

  Path({
    required this.id,
    required this.titulo,
    required this.subtitulo,
    required this.imagen,
    required this.dias,
    required this.ingreso
  });
}
