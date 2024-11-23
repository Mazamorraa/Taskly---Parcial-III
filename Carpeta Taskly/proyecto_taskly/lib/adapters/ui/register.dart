import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';

class RegisterPage extends StatefulWidget {
  static const String routeName = 'register';
  final String title;
  const RegisterPage({super.key, required this.title});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefonoController = TextEditingController();
  final TextEditingController direccionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
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
                    label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
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
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
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
                    label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
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
                      label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
                ),
                const SizedBox(height: 10),

                const Align(
                    alignment: Alignment.centerLeft,
                    child: MyText(
                        label: 'Phone number',
                        size: 20,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                // text field
                Align(
                  alignment: Alignment.center,
                  child: MyTextfield(
                      controller: telefonoController,
                      hintText: 'Insert number...',
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
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
                      controller: telefonoController,
                      hintText: 'Insert address...',
                      obscureText: false,
                      color: AppColors.Subtitulos,
                      altura: 50,
                      ancho: 350,
                      label: 'hola', icon: Icons.abc, iconColor: AppColors.TextField,),
                ),
                const SizedBox(height: 24),

                // Log in button
                MyButton(
                  text: 'Register',
                  altura: 60,
                  ancho: 280,
                  onTap: () {
                    // Mostrar mensaje de registro exitoso
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Registrado correctamente'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );

                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pushReplacementNamed(context, Login.routeName);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
