import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
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

  List<Solicitud> obtenerSolicitudes() {
    return solicitudes;
  }

  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
        contrasena: json["contrasena"],
        telefono: json["telefono"],
        direccion: json["direccion"],
        calificacion: json["calificacion"].toDouble(),
        solicitudes: [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
        "contrasena": contrasena,
        "telefono": telefono,
        "direccion": direccion,
        "calificacion": calificacion,
        "solicitudes": [],
      };
}
