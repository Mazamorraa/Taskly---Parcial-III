import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/AboutMePage_especialista.dart'; // Importa la pantalla
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/llenarServicio.dart';
import 'package:proyecto_taskly/adapters/ui/mainScreen.dart';
import 'package:proyecto_taskly/adapters/ui/peticionEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/propuestaEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/register.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/adapters/ui/servicioCompleto.dart';
import 'package:proyecto_taskly/adapters/ui/verificationPage_especialista.dart';
import 'package:proyecto_taskly/adapters/ui/IdCardPage_especialista.dart';
import 'package:proyecto_taskly/adapters/ui/CatalogOfServicesPage_especialista.dart';
import 'package:proyecto_taskly/adapters/ui/CatalogOfServicesPage2_especialista.dart'; // Importa la nueva pantalla

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute:
          CatalogOfServicesPage2Especialista.routeName, // Ruta inicial
      routes: {
        Mainscreen.routeName: (context) =>
            const Mainscreen(title: 'Main Screen'),
        Login.routeName: (context) => Login(
              title: 'log in',
            ),
        RegisterPage.routeName: (context) =>
            const RegisterPage(title: 'Register'),
        MyHomePage.routeName: (context) => const MyHomePage(title: 'Home'),
        Llenardatos.routeName: (context) => const Llenardatos(title: 'datos'),
        Peticionespecialista.routeName: (context) =>
            const Peticionespecialista(title: 'peticiones'),
        PropuestaEspecialista.routeName: (context) =>
            const PropuestaEspecialista(title: 'propuesta'),
        Serviciocompleto.routeName: (context) =>
            const Serviciocompleto(nombre: '', descripcion: '', precio: ''),
        VerificationPageEspecialista.routeName: (context) =>
            const VerificationPageEspecialista(),
        AboutMeEspecialista.routeName: (context) => const AboutMeEspecialista(),
        IdCardPageEspecialista.routeName: (context) =>
            const IdCardPageEspecialista(),
        CatalogOfServicesPageEspecialista.routeName: (context) =>
            const CatalogOfServicesPageEspecialista(),
        CatalogOfServicesPage2Especialista.routeName: (context) =>
            const CatalogOfServicesPage2Especialista(), // Nueva pantalla registrada
      },
    );
  }
}
