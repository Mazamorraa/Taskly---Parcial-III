import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_bloc.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_event.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_state.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';
import 'package:proyecto_taskly/adapters/ui/servicioCompleto.dart'; // Importa la pantalla de servicio completo

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersBloc(PreferenciasTaskly())..add(LoadOrders()),
      child: SafeArea(
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
              BlocBuilder<OrdersBloc, OrdersState>(
                builder: (context, state) {
                  if (state is OrdersLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OrdersError) {
                    return Center(child: Text('Error: ${state.message}'));
                  } else if (state is OrdersLoaded) {
                    final solicitudes = state.solicitudes;
                    if (solicitudes.isEmpty) {
                      return const Center(
                          child: Text('No hay solicitudes disponibles.'));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: solicitudes.length,
                        itemBuilder: (context, index) {
                          final solicitud = solicitudes[index];
                          return Card(
                            child: ListTile(
                              title: Text(
                                  'Servicio: ${solicitud.servicio.nombre}'),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cliente: ${solicitud.cliente.nombre}'),
                                  Text('Especialista: Sebastian Andrade Roa'),
                                  Text('Estado: ${solicitud.estado}'),
                                  Text(
                                      'Precio Final: \$${solicitud.precioFinal}'),
                                  Text(
                                      'Fecha: ${DateFormat('yyyy-MM-dd').format(solicitud.fechaSolicitud)}'),
                                  Text('Dirección: ${solicitud.direccion}'),
                                ],
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Serviciocompleto(
                                      nombre: solicitud.servicio.nombre,
                                      descripcion:
                                          solicitud.servicio.descripcion,
                                      precio: solicitud.precioFinal.toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
