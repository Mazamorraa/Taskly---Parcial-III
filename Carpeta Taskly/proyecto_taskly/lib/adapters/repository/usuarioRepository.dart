import 'dart:convert';
import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';
import 'package:proyecto_taskly/domain/repository/usuario_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {
  final String _dataPath = 'assets/data.json';

  @override
// Agregar usuario en SharedPreferences
Future<void> agregarCliente(Cliente nuevoCliente) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  
  // Cargar usuarios existentes
  List<String> usuariosString = prefs.getStringList('usuarios') ?? [];
  
  // Agregar nuevo cliente
  usuariosString.add(json.encode({
    'id': nuevoCliente.id,
    'nombre': nuevoCliente.nombre,
    'email': nuevoCliente.email,
    'contrasena': nuevoCliente.contrasena,
    'telefono': nuevoCliente.telefono,
    'direccion': nuevoCliente.direccion,
    'calificacion': nuevoCliente.calificacion,
    'tipoUsuario': 'Cliente',
  }));

  // Guardar lista actualizada
  await prefs.setStringList('usuarios', usuariosString);
}

// Leer usuarios
Future<List<Usuario>> obtenerUsuario() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> usuariosString = prefs.getStringList('usuarios') ?? [];

  return usuariosString.map((usuarioStr) {
    final jsonUsuario = json.decode(usuarioStr);
    return Cliente(
      id: jsonUsuario['id'],
      nombre: jsonUsuario['nombre'],
      email: jsonUsuario['email'],
      contrasena: jsonUsuario['contrasena'],
      telefono: jsonUsuario['telefono'],
      direccion: jsonUsuario['direccion'],
      calificacion: (jsonUsuario['calificacion'] as num).toDouble(),
      solicitudes: [],
    );
  }).toList();
}
}







  
