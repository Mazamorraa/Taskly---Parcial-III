import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/repository/solicitud_repository.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  late Future<List<Solicitud>> _solicitudesFuture;

  @override
  void initState() {
    super.initState();
    _solicitudesFuture = cargarSolicitudesDesdePrefs(); // Nueva función
  }

  Future<List<Solicitud>> cargarSolicitudesDesdePrefs() async {
    final PreferenciasTaskly prefs = PreferenciasTaskly();
    await prefs.initPrefs();
    return await prefs
        .getSolicitudes(); // Carga solicitudes desde SharedPreferences
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.White,
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: MyText(
                label: 'My Orders',
                size: 35,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            FutureBuilder<List<Solicitud>>(
              future: _solicitudesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No hay solicitudes disponibles.'));
                } else {
                  final solicitudes = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: solicitudes.length,
                      itemBuilder: (context, index) {
                        final solicitud = solicitudes[index];
                        return Card(
                          child: ListTile(
                            title:
                                Text('Servicio: ${solicitud.servicio.nombre}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cliente: ${solicitud.cliente.nombre}'),
                                Text(
                                    'Especialista: ${solicitud.especialista.nombre}'),
                                Text('Estado: ${solicitud.estado}'),
                                Text(
                                    'Precio Final: \$${solicitud.precioFinal}'),
                                Text(
                                    'Fecha: ${DateFormat('yyyy-MM-dd').format(solicitud.fechaSolicitud)}'),
                                Text('Dirección: ${solicitud.direccion}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
