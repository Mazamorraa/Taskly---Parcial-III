import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
import 'package:proyecto_taskly/domain/repository/solicitud_repository.dart';

class ObtenerSolicitudesUseCase {
  final SolicitudRepository solicitudRepository;

  ObtenerSolicitudesUseCase(this.solicitudRepository);

  Future<List<Solicitud>> ejecutar() async {
    return await solicitudRepository.obtenerSolicitudes();
  }
}