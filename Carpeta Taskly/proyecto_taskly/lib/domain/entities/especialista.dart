

import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';

class Especialista extends Usuario {
  String profesion;
  List<Servicio> servicios;

  Especialista({
    required super.id,
    required super.nombre,
    required super.email,
    required super.contrasena,
    required super.telefono,
    required super.direccion,
    required super.calificacion,
    required super.solicitudes,
    required this.profesion,
    required this.servicios,
  });


}