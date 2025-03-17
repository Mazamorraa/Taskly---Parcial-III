import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/especialista.dart';
import 'package:proyecto_taskly/domain/entities/servicio.dart';

class Solicitud {
  final int id;
  final String estado;
  final double precioFinal;
  final DateTime fechaSolicitud;
  final String direccion;
  final Cliente cliente;
  final Especialista especialista;
  final Servicio servicio;

  Solicitud({
    required this.id,
    required this.estado,
    required this.precioFinal,
    required this.fechaSolicitud,
    required this.direccion,
    required this.cliente,
    required this.especialista,
    required this.servicio,
  });
  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        id: json["id"],
        estado: json["estado"],
        precioFinal: json["precioFinal"],
        fechaSolicitud: DateTime.parse(json["fechaSolicitud"]),
        direccion: json["direccion"],
        servicio: Servicio.fromJson(json["servicio"]),
        especialista: Especialista.fromJson(json["especialista"]),
        cliente: Cliente.fromJson(json["cliente"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estado": estado,
        "precioFinal": precioFinal,
        "fechaSolicitud": fechaSolicitud.toIso8601String(),
        "direccion": direccion,
        "servicio": servicio.toJson(),
        "especialista": especialista.toJson(),
        "cliente": cliente.toJson(),
      };
}
