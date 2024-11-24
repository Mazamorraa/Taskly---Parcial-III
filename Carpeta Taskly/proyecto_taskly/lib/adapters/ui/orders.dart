import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/repository/solicitud_repository.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

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
    _solicitudesFuture = SolicitudRepositoryImpl().obtenerSolicitudes();
    // Prueba para verificar si se llama al método correctamente.
    print('Llamada a obtenerSolicitudes iniciada');
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
                // Verifica si la solicitud está en proceso.
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('Estado: Cargando datos');
                  return const Center(child: CircularProgressIndicator());
                }
                // Verifica si ocurrió un error y muestra detalles.
                else if (snapshot.hasError) {
                  print('Error encontrado: ${snapshot.error}');
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                // Verifica si no hay datos.
                else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  print('Estado: No se encontraron solicitudes');
                  return const Center(child: Text('No hay solicitudes disponibles.'));
                }
                // Los datos se han cargado correctamente.
                else {
                  final solicitudes = snapshot.data!;
                  print('Solicitudes cargadas correctamente: $solicitudes');
                  return Expanded(
                    child: ListView.builder(
                      itemCount: solicitudes.length,
                      itemBuilder: (context, index) {
                        final solicitud = solicitudes[index];
                        print('Mostrando solicitud ${index + 1}: ${solicitud.servicio.nombre}');
                        return Card(
                          child: ListTile(
                            title: Text('Servicio: ${solicitud.servicio.nombre}'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cliente: ${solicitud.cliente.nombre}'),
                                Text('Especialista: ${solicitud.especialista.nombre}'),
                                Text('Estado: ${solicitud.estado}'),
                                Text('Precio Final: \$${solicitud.precioFinal}'),
                                Text('Fecha: ${solicitud.fechaSolicitud}'),
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
