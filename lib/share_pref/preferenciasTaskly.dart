import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../domain/entities/cliente.dart';
import '../domain/entities/solicitudes.dart';

class PreferenciasTaskly {
  static final PreferenciasTaskly _instance = PreferenciasTaskly._internal();
  late SharedPreferences _prefs;

  factory PreferenciasTaskly() {
    return _instance;
  }

  PreferenciasTaskly._internal();

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveCliente(Cliente cliente) async {
    final String clienteJson = jsonEncode(cliente.toJson());
    await _prefs.setString('cliente', clienteJson);
  }

  Future<Cliente?> getCliente() async {
    final String? clienteJson = _prefs.getString('cliente');
    if (clienteJson == null) {
      return null;
    }
    return Cliente.fromJson(jsonDecode(clienteJson));
  }

  Future<void> saveSolicitudes(List<Solicitud> nuevasSolicitudes) async {
    final List<Solicitud> solicitudesExistentes = await getSolicitudes();

    solicitudesExistentes.addAll(nuevasSolicitudes);

    final String solicitudesJson =
        jsonEncode(solicitudesExistentes.map((e) => e.toJson()).toList());
    await _prefs.setString('solicitudes', solicitudesJson);
  }

  Future<List<Solicitud>> getSolicitudes() async {
    final String? solicitudesString = _prefs.getString('solicitudes');
    if (solicitudesString != null) {
      final List<dynamic> decodedData = jsonDecode(solicitudesString);
      return decodedData
          .map<Solicitud>((json) => Solicitud.fromJson(json))
          .toList();
    }
    return [];
  }
}
