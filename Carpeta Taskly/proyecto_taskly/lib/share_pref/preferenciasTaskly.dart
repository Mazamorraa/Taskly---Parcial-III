import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../domain/entities/cliente.dart';
import '../domain/entities/solicitudes.dart';

class PreferenciasTaskly {
  late SharedPreferences _prefs;


  static final PreferenciasTaskly _instance = PreferenciasTaskly._internal();
  factory PreferenciasTaskly() => _instance;
  PreferenciasTaskly._internal();

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }


  Future<void> saveSolicitudes(List<Solicitud> solicitudes) async {
    String solicitudesJson = json.encode(solicitudes.map((s) => s.toJson()).toList());
    await _prefs.setString('solicitudes', solicitudesJson);
  }


  Future<List<Solicitud>> getSolicitudes() async {
    String? solicitudesJson = _prefs.getString('solicitudes');
    if (solicitudesJson != null) {
      List<dynamic> decodedList = json.decode(solicitudesJson);
      return decodedList.map((json) => Solicitud.fromJson(json)).toList();
    }
    return [];
  }

  Future<void> saveCliente(Cliente cliente) async {
    String clienteJson = json.encode(cliente.toJson());
    await _prefs.setString('cliente', clienteJson);
  }

  Future<Cliente?> getCliente() async {
    String? clienteJson = _prefs.getString('cliente');
    if (clienteJson != null) {
      return Cliente.fromJson(json.decode(clienteJson));
    }
    return null;
  }
}
