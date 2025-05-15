

import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/repository/servicio_repository.dart';

class ObtenerServiciosUseCase {
  final ServicioRepository servicioRepository;

  ObtenerServiciosUseCase(this.servicioRepository);

  Future<List<Servicio>> ejecutar() async {
    return await servicioRepository.obtenerServicios();
  }
}