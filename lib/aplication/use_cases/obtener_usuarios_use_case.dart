
import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/especialista.dart';
import 'package:proyecto_taskly/domain/repository/usuario_repository.dart';

class ObtenerClientesUseCase {
  final UsuarioRepository usuarioRepository;

  ObtenerClientesUseCase(this.usuarioRepository);

  Future<List<Cliente>> ejecutar() async {
    final usuarios = await usuarioRepository.obtenerUsuario();
    return usuarios.whereType<Cliente>().toList();
  }
}

class ObtenerEspecialistasUseCase {
  final UsuarioRepository usuarioRepository;

  ObtenerEspecialistasUseCase(this.usuarioRepository);

  Future<List<Especialista>> ejecutar() async {
    final usuarios = await usuarioRepository.obtenerUsuario();
    return usuarios.whereType<Especialista>().toList();
  }
}


