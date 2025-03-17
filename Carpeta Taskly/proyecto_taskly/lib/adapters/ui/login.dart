import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_taskly/adapters/repository/usuario_Repository.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/register.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_bloc.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_event.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_state.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';
import 'package:proyecto_taskly/domain/repository/usuario_repository.dart';
import 'package:proyecto_taskly/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login';
  final String title;

  const Login({super.key, required this.title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final UsuarioRepository usuarioRepository = UsuarioRepositoryImpl();

  Future<void> _login() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final List<Usuario> usuarios = await usuarioRepository.obtenerUsuario();
      final usuario = usuarios.firstWhere(
        (user) => user.nombre == username && user.contrasena == password,
        orElse: () => throw Exception('Usuario no encontrado'),
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('usuario_id', usuario.id.toString());
      prefs.setString('usuario_nombre', usuario.nombre);

      context.read<OrdersBloc>().add(ShowLoading());
      await Future.delayed(Duration(seconds: 2));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(
            usuario: usuario,
            title: '',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión: $e'),
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
                if (state is OrdersInitial) {}
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
                      width: getProportionateScreenWidth(200),
                      height: getProportionateScreenHeight(200),
                      fit: BoxFit.cover,
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
                    const SizedBox(height: 24),

                    // Log in button
                    MyButton(
                      text: 'Log in',
                      altura: 60,
                      ancho: 280,
                      onTap: () {
                        _login();
                      },
                    ),

                    const SizedBox(height: 20),

                    // Register text
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, RegisterPage.routeName);
                      },
                      child: const Text(
                        "You don't have an account? Register now",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
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
