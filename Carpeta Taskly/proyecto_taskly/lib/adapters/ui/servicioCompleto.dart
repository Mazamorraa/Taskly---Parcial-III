
import 'package:flutter/material.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'propuestaEspecialista.dart';

class Serviciocompleto extends StatefulWidget {
  static const String routeName = 'ServicioCompleto';
  final String? title;

  final String nombre;
  final String descripcion;
  final String precio;

  const Serviciocompleto({super.key, required this.nombre, required this.descripcion, required this.precio, this.title});
  

  @override
  State<Serviciocompleto> createState() => _ServiciocompletoState();
}

class _ServiciocompletoState extends State<Serviciocompleto> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.nombre),
        backgroundColor: AppColors.AppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              widget.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Precio: ${widget.precio}',
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}