import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/repository/servicio_repository.dart';


class ServicioRepositoryImpl implements ServicioRepository {
  @override
  Future<List<Servicio>> obtenerServicios() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final List<dynamic> data = json.decode(response)['servicios'];

    return data.map<Servicio>((jsonServicio) {
      return Servicio(
        id: jsonServicio['id'],
        nombre: jsonServicio['nombre'],
        descripcion: jsonServicio['descripcion'],
        precio: jsonServicio['precio'],
      );
    }).toList();
  }
}