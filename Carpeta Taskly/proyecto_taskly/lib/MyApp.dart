import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/llenarServicio.dart';
import 'package:proyecto_taskly/adapters/ui/mainScreen.dart';
import 'package:proyecto_taskly/adapters/ui/peticionEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/propuestaEspecialista.dart';
import 'package:proyecto_taskly/adapters/ui/register.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/adapters/ui/servicioCompleto.dart';
import 'package:proyecto_taskly/domain/entities/cliente.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Cliente usuarioCliente = Cliente(
  id: 1,
  nombre: 'Sebastian',
  email: 'sebastian@example.com',
  contrasena: 'password123',
  telefono: '123456789',
  direccion: '123 Calle Principal',
  calificacion: 4.5,
  solicitudes: [],
);

    return MaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: Mainscreen.routeName,
      routes: {
        Mainscreen.routeName: (context) =>
            const Mainscreen(title: 'Main Screen'),
        Login.routeName: (context) => const Login(title: 'Log in'),
        RegisterPage.routeName: (context) =>
            const RegisterPage(title: 'Register'),
        MyHomePage.routeName: (context) =>
            MyHomePage(title: 'Home', usuario: usuarioCliente), 
        Llenardatos.routeName: (context) =>
            Llenardatos(title: 'Datos', usuario: usuarioCliente,),
        Peticionespecialista.routeName: (context) =>
            Peticionespecialista(title: 'Peticiones', usuario: usuarioCliente,),
        PropuestaEspecialista.routeName: (context) =>
           PropuestaEspecialista(title: 'Propuesta', usuario: usuarioCliente,),
        Serviciocompleto.routeName: (context) => const Serviciocompleto(
              nombre: '',
              descripcion: '',
              precio: '',
            ),
      },
      home: const Mainscreen(title: ''),
    );
  }
}