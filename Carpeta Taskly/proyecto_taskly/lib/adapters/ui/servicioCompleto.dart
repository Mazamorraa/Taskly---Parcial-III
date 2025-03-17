import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';

class Serviciocompleto extends StatefulWidget {
  static const String routeName = '/serviciocompleto';
  final String? title;

  final String nombre;
  final String descripcion;
  final String precio;

  const Serviciocompleto({
    super.key,
    required this.nombre,
    required this.descripcion,
    required this.precio,
    this.title,
  });

  @override
  State<Serviciocompleto> createState() => _ServiciocompletoState();
}

class _ServiciocompletoState extends State<Serviciocompleto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, MyHomePage.routeName);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: AppColors.black,
                    size: 25,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 0, top: 10, bottom: 5),
                  child: Container(
                    width: 65.0,
                    height: 65.0,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Icon(Icons.account_circle, size: 70),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nombre: Sebastian Andrade Roa',
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(height: 10),
                          Text('Precio: ${widget.precio}',
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const RatingStars(rating: 4),
            const MyText(
                label:
                    'professional specialized in the installation, repair, and maintenance of piping systems that supply water, gas, and remove waste in residential, commercial, and industrial buildings. Their work includes fixing leaks, unclogging drains, installing fixtures, repairing water heaters, and ensuring that the plumbing system operates safely and efficiently',
                size: 12,
                color: AppColors.Subtitulos,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      MyText(
                        label: 'Calle falsa 82',
                        size: 20,
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.workspace_premium,
                        size: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: MyText(
                          label:
                              'professional specialized in the installation, repair, and maintenance of piping systems that supply water...',
                          size: 20,
                          fontWeight: FontWeight.normal,
                          color: AppColors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              'Precio: ${widget.precio}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
