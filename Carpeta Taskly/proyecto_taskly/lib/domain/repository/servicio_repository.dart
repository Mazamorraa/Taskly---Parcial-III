
import 'package:proyecto_taskly/domain/entities/servicio.dart';

abstract class ServicioRepository {
  Future<List<Servicio>> obtenerServicios();
}