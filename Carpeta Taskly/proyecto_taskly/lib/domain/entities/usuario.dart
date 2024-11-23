import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

abstract class Usuario {
  int id;
  String nombre;
  String email;
  String contrasena;
  String telefono;
  String direccion;
  double calificacion;
  List<Solicitudes> solicitudes;

  Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    required this.contrasena,
    required this.telefono,
    required this.direccion,
    required this.calificacion,
    required this.solicitudes,
  });


}

class Cliente extends Usuario {
  Cliente({
    required super.id,
    required super.nombre,
    required super.email,
    required super.contrasena,
    required super.telefono,
    required super.direccion,
    required super.calificacion,
    required super.solicitudes,
  });

}

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


