import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';

class Solicitudes {
    int id;
    Cliente cliente;
    Especialista especialista;
    String estado;
    int precioFinal;
    DateTime fechaSolicitud;
    Servicio servicio;

    Solicitudes({
        required this.id,
        required this.cliente,
        required this.especialista,
        required this.estado,
        required this.precioFinal,
        required this.fechaSolicitud,
        required this.servicio,
    });

   
}