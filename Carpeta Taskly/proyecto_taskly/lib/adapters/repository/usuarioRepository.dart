import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/especialista.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';
import 'package:proyecto_taskly/domain/repository/usuario_repository.dart';

class UsuarioRepositoryImpl implements UsuarioRepository {

  @override
  Future<List<Usuario>> obtenerUsuario() async {
    // TODO: implement obtenerUsuario
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response)['usuarios'] as List<dynamic>;

    return data.map<Usuario>((jsonUsuario) {
      if (jsonUsuario['tipoUsuario'] == 'Cliente') {
        return Cliente(
          id: jsonUsuario['id'],
          nombre: jsonUsuario['nombre'],
          email: jsonUsuario['email'],
          contrasena: jsonUsuario['contrasena'],
          telefono: jsonUsuario['telefono'],
          direccion: jsonUsuario['direccion'],
          calificacion: jsonUsuario['calificacion'].toDouble(),
          solicitudes: [], 
        );
      } else if (jsonUsuario['tipoUsuario'] == 'Especialista') {
        return Especialista(
          id: jsonUsuario['id'],
          nombre: jsonUsuario['nombre'],
          email: jsonUsuario['email'],
          contrasena: jsonUsuario['contrasena'],
          telefono: jsonUsuario['telefono'],
          direccion: jsonUsuario['direccion'],
          calificacion: jsonUsuario['calificacion'].toDouble(),
          profesion: jsonUsuario['profesion'],
          servicios: [], 
          solicitudes: [], 
        );
      } else {
        throw Exception('Tipo de usuario desconocido');
      }
    }).toList();
  }

}








  
