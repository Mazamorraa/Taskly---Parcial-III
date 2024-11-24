

import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

abstract class SolicitudRepository {
  Future<List<Solicitud>> obtenerSolicitudes();
}