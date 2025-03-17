import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_taskly/adapters/repository/usuario_Repository.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_bloc.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_event.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_state.dart';
import 'package:proyecto_taskly/aplication/use_cases/obtener_usuarios_use_case.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/repository/usuario_repository.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';
import 'package:proyecto_taskly/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = 'register';
  final String title;
  const RegisterPage({super.key, required this.title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  final UsuarioRepository usuarioRepository = UsuarioRepositoryImpl();
  final ObtenerClientesUseCase obtenerClientesUseCase =
      ObtenerClientesUseCase(UsuarioRepositoryImpl());

  Future<void> _registrarCliente() async {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        emailController.text.isEmpty ||
        telefonoController.text.isEmpty ||
        direccionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final nuevoCliente = Cliente(
        id: int.parse(idController.text),
        nombre: usernameController.text,
        email: emailController.text,
        contrasena: passwordController.text,
        telefono: telefonoController.text,
        direccion: direccionController.text,
        calificacion: 5,
        solicitudes: [],
      );

      await usuarioRepository.agregarCliente(nuevoCliente);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
        ),
      );

      // Guarda en SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('usuario_id', nuevoCliente.id.toString());
      prefs.setString('usuario_nombre', nuevoCliente.nombre);

      // Guarda el cliente completo en SharedPreferences
      final PreferenciasTaskly preferenciasTaskly = PreferenciasTaskly();
      await preferenciasTaskly.initPrefs();
      await preferenciasTaskly.saveCliente(nuevoCliente);

      context.read<OrdersBloc>().add(ShowLoading());
      await Future.delayed(Duration(seconds: 2));

      Navigator.pushReplacementNamed(context, Login.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al registrar usuario: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: BlocConsumer<OrdersBloc, OrdersState>(
              listener: (context, state) {
                if (state is OrdersInitial) {
                  // Do nothing
                }
              },
              builder: (context, state) {
                if (state is Loading) {
                  return CircularProgressIndicator();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/img/taskly_logo.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'Id',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // User text field
                    MyTextfield(
                      controller: idController,
                      hintText: 'Insert id...',
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola',
                      icon: Icons.abc,
                      iconColor: AppColors.TextField,
                    ),
                    const SizedBox(height: 10),

                    // User label
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'User',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // User text field
                    MyTextfield(
                      controller: usernameController,
                      hintText: 'Insert user...',
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola',
                      icon: Icons.abc,
                      iconColor: AppColors.TextField,
                    ),
                    const SizedBox(height: 10),

                    // Password label
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'Password',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // User text field
                    Align(
                      alignment: Alignment.center,
                      child: MyTextfield(
                        controller: passwordController,
                        hintText: 'Insert password...',
                        obscureText: true,
                        color: AppColors.Subtitulos,
                        altura: 50,
                        ancho: 350,
                        label: 'hola',
                        icon: Icons.abc,
                        iconColor: AppColors.TextField,
                      ),
                    ),
                    const SizedBox(height: 10),

                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'Email',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // User text field
                    MyTextfield(
                      controller: emailController,
                      hintText: 'Insert email...',
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola',
                      icon: Icons.abc,
                      iconColor: AppColors.TextField,
                    ),
                    const SizedBox(height: 10),

                    // Password label
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'Phone number',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    //  text field
                    Align(
                      alignment: Alignment.center,
                      child: MyTextfield(
                        controller: telefonoController,
                        hintText: 'Insert number...',
                        obscureText: false,
                        color: AppColors.Subtitulos,
                        altura: 50,
                        ancho: 350,
                        label: 'hola',
                        icon: Icons.abc,
                        iconColor: AppColors.TextField,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'Address',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    // text field
                    Align(
                      alignment: Alignment.center,
                      child: MyTextfield(
                        controller: direccionController,
                        hintText: 'Insert address...',
                        obscureText: false,
                        color: AppColors.Subtitulos,
                        altura: 50,
                        ancho: 350,
                        label: 'hola',
                        icon: Icons.abc,
                        iconColor: AppColors.TextField,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Log in button
                    MyButton(
                      text: 'Register',
                      altura: 60,
                      ancho: 280,
                      onTap: () {
                        _registrarCliente();
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
