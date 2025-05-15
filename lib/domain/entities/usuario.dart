import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

abstract class Usuario {
  int id;
  String nombre;
  String email;
  String contrasena;
  String telefono;
  String direccion;
  double calificacion;
  List<Solicitud> solicitudes;

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






