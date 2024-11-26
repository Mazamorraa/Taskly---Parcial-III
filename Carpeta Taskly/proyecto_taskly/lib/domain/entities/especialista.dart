

import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
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

  factory Especialista.fromJson(Map<String, dynamic> json) => Especialista(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
        contrasena: json["contrasena"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        calificacion: json["calificacion"].toDouble(),
        solicitudes: List<Solicitud>.from(json["solicitudes"].map((x) => Solicitud.fromJson(x))), profesion: '', servicios: [],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
        "contrasena": contrasena,
        "telefono": telefono,
        "direccion": direccion,
        "calificacion": calificacion,
        "solicitudes": List<dynamic>.from(solicitudes.map((x) => x.toJson())),
    };


}