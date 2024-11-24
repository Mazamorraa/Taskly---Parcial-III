
import 'package:proyecto_taskly/domain/entities/usuario.dart';

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