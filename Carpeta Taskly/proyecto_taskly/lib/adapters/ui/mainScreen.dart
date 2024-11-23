import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/size_config.dart';

class Mainscreen extends StatelessWidget {
  static const String routeName = 'Main Screen';
  final String title;

  const Mainscreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.White,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/taskly_logo.jpg',
                width: 340,
                height: 212,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 33),
              MyButton(
                text: 'Start now!',
                altura: 74.78,
                ancho: 230,
                onTap: () {
                  Navigator.pushReplacementNamed(context, Login.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
