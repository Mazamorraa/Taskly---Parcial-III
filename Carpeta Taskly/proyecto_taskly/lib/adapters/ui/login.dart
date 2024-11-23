import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/register.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/size_config.dart';

class Login extends StatelessWidget {
  static const String routeName = 'login';
  final String title;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Login(
      {super.key, usernameController, passwordController, required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
                    label: 'hola',icon: Icons.abc, iconColor: AppColors.TextField,),
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
                const SizedBox(height: 24),

                // Log in button
                MyButton(
                  text: 'Log in',
                  altura: 60,
                  ancho: 280,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, MyHomePage.routeName);
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
                      decoration: TextDecoration
                          .underline, 
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
