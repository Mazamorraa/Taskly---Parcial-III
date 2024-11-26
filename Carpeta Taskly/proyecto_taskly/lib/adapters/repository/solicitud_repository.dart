import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
import 'package:proyecto_taskly/domain/repository/solicitud_repository.dart';

class SolicitudRepositoryImpl implements SolicitudRepository {
  @override
  Future<List<Solicitud>> obtenerSolicitudes() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);

    List<Solicitud> solicitudes = [];

    if (data['clientes'] != null) {
      List<dynamic> clientesData = data['clientes'];

      for (var cliente in clientesData) {
        if (cliente['solicitudes'] != null) {
          for (var solicitudJson in cliente['solicitudes']) {
            solicitudes.add(Solicitud.fromJson(solicitudJson));
          }
        }
      }
    }

    return solicitudes;
  }
}

  /*Future<List<Solicitud>> obtenerSolicitudes() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> data = json.decode(response);

    List<dynamic> solicitudesJson = data['solicitudes'];

    return solicitudesJson.map<Solicitud>((jsonSolicitud) {
      final clienteData = jsonSolicitud['cliente'];
      final especialistaData = jsonSolicitud['especialista'];
      final servicioData = jsonSolicitud['servicio'];

      final servicio = Servicio(
        id: servicioData['id'],
        nombre: servicioData['nombre'],
        descripcion: servicioData['descripcion'],
        precio: servicioData['precio'],
      );

      // Crear instancia de Cliente
      final cliente = Cliente(
        id: clienteData['id'],
        nombre: clienteData['nombre'],
        email: clienteData['email'] ?? '',
        contrasena: clienteData['contrasena'] ?? '',
        telefono: clienteData['telefono'] ?? '',
        direccion: clienteData['direccion'] ?? '',
        calificacion: clienteData['calificacion'] ?? 0.0,
        solicitudes: [],
      );

      // Crear instancia de Especialista
      final especialista = Especialista(
        id: especialistaData['id'],
        nombre: especialistaData['nombre'],
        email: especialistaData['email'] ?? '',
        contrasena: especialistaData['contrasena'] ?? '',
        telefono: especialistaData['telefono'] ?? '',
        direccion: especialistaData['direccion'] ?? '',
        calificacion: especialistaData['calificacion'] ?? 0.0,
        profesion: especialistaData['profesion'] ?? '',
        servicios: [],
        solicitudes: [],
      );

      
      

      // Crear instancia de Solicitud
      return Solicitud(
        id: jsonSolicitud['id'],
        estado: jsonSolicitud['estado'],
        precioFinal: jsonSolicitud['precioFinal'],
        fechaSolicitud: jsonSolicitud['fechaSolicitud'],
        direccion: jsonSolicitud['direccion'],
        cliente: cliente,
        especialista: especialista,
        servicio: servicio,
      );
    }).toList();
  }*/




/*class SolicitudRepositoryImpl implements SolicitudRepository {
  @override
  Future<List<Solicitud>> obtenerSolicitudes() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final Map<String, dynamic> jsonData = json.decode(response);
    final List<dynamic> solicitudesJson = jsonData['solicitudes'];

    return solicitudesJson.map<Solicitud>((jsonSolicitud) {
      final cliente = Cliente(
        id: jsonSolicitud['cliente']['id'],
        nombre: jsonSolicitud['cliente']['nombre'], 
        email: jsonSolicitud['cliente']['email'], 
        contrasena: jsonSolicitud['cliente']['contrasena'], 
        telefono: jsonSolicitud['cliente']['telefono'], 
        direccion: '', 
        calificacion: , 
        solicitudes: Solicitud(id: , estado: estado, precioFinal: precioFinal, fechaSolicitud: fechaSolicitud, direccion: direccion, cliente: cliente, especialista: especialista, servicio: servicio),
      );

      final especialista = Especialista(
        id: jsonSolicitud['especialista']['id'],
        nombre: jsonSolicitud['especialista']['nombre'],
      );

      final servicio = Servicio(
        id: jsonSolicitud['servicio']['id'],
        nombre: jsonSolicitud['servicio']['nombre'],
        descripcion: jsonSolicitud['servicio']['descripcion'],
        precio: jsonSolicitud['servicio']['precio'].toDouble(),
      );

      return Solicitud(
        id: jsonSolicitud['id'],
        estado: jsonSolicitud['estado'],
        precioFinal: jsonSolicitud['precioFinal'].toDouble(),
        fechaSolicitud: jsonSolicitud['fechaSolicitud'],
        direccion: jsonSolicitud['direccion'],
        cliente: cliente,
        especialista: especialista,
        servicio: servicio,
      );
    }).toList();
  }
}*/


