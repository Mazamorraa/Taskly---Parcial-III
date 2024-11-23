import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/llenarServicio.dart';
import 'package:proyecto_taskly/adapters/ui/mainScreen.dart';
import 'package:proyecto_taskly/adapters/ui/peticionEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/propuestaEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/register.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/adapters/ui/servicioCompleto.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: Mainscreen.routeName,
      routes: {
        Mainscreen.routeName: (context) => const Mainscreen(title: 'Main Screen'),
        Login.routeName: (context) => Login(title: 'log in',),
        RegisterPage.routeName: (context) => const RegisterPage(title: 'Register'),
        MyHomePage.routeName: (context) => const MyHomePage(title: 'Home'),
        Llenardatos.routeName: (context) => const Llenardatos(title: 'datos'),
        Peticionespecialista.routeName: (context) => const Peticionespecialista(title: 'peticiones'),
        PropuestaEspecialista.routeName: (context) => const PropuestaEspecialista(title: 'propuesta'),
        Serviciocompleto.routeName: (context) => const Serviciocompleto(nombre: '', descripcion: '', precio: '')
      },
      home: const Mainscreen(title: '',),
    );
  }
}