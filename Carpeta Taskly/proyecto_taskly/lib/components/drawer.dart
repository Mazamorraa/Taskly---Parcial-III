import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/VerificationPage_especialista.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';

class Drawer_menu extends StatelessWidget {
  final Usuario usuario;
  final String username;

  const Drawer_menu({super.key, required this.username, required this.usuario});

  @override
  Widget build(BuildContext context) {
    /*Future<void> cerrarSesion() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }*/

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Encabezado del Drawer
          DrawerHeader(
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: const BoxDecoration(
                color: Color.fromARGB(181, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 0, top: 10, bottom: 5),
                    child: CircleAvatar(
                      radius: 30,
                      child: Text(usuario.nombre[0]),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          usuario.nombre,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Text(
                          usuario.email,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 117, 117, 117),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          children: List.generate(5, (index) {
                            return const Icon(
                              Icons.star,
                              size: 15,
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Otros elementos del Drawer
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.pushReplacementNamed(context, MyHomePage.routeName);
            },
          ),
          ListTile(
            title: const Text('Exit'),
            leading: const Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.pushReplacementNamed(context, Login.routeName);
            },
          ),
          const SizedBox(
            height: 600,
          ),

          MyButton(
            text: 'Specialist mode',
            altura: 60,
            ancho: 250,
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, VerificationPageEspecialista.routeName);
            },
          ),
        ],
      ),
    );
  }
}
