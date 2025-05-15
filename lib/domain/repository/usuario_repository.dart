

import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';

abstract class UsuarioRepository {
  Future<List<Usuario>> obtenerUsuario();
  Future<void> agregarCliente(Cliente cliente); 
  }