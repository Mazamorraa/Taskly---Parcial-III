import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';

class Drawer_menu extends StatelessWidget {
  final String username;
  
  const Drawer_menu({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(
              width: 500,
              height: 59,
              decoration: const BoxDecoration(
                color: Color.fromARGB(181, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 0, top: 10, bottom: 5),
                        child: Container(
                          width: 65.0,
                          height: 65.0,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 216, 216, 216),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 15, top: 40),
                              child: Row(children: [
                                Text(
                                  username, // Mostrar el nombre de usuario
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])),
                          const Padding(
                            padding: EdgeInsets.only(left: 15, top: 0),
                            child: Text(
                              "Client",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 117, 117, 117),
                                  fontSize: 12),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Row(
                                children: List.generate(5, (index) {
                                  return const Icon(
                                    Icons.star,
                                    size: 15,
                                  );
                                }),
                              ))
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
              title: const Text('Home'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.pushReplacementNamed(context, MyHomePage.routeName);
              }),
          ListTile(
              title: const Text('Exit'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.pushReplacementNamed(context, Login.routeName);
              }),
        ],
      ),
    );
  }
}