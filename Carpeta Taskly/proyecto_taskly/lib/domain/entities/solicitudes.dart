import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/especialista.dart';
import 'package:proyecto_taskly/domain/entities/servicio.dart';

class Solicitud {
  final int id;
  final String estado;
  final double precioFinal;
  final String fechaSolicitud;
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
}