import 'package:flutter/material.dart';
import 'package:proyecto_taskly/components/colors.dart'; // Asegúrate de definir tus colores aquí

class RegisterPageEspecialista extends StatefulWidget {
  static const String routeName = 'register_especialista';

  const RegisterPageEspecialista({super.key});

  @override
  _RegisterPageEspecialistaState createState() =>
      _RegisterPageEspecialistaState();
}

class _RegisterPageEspecialistaState extends State<RegisterPageEspecialista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person_add_alt_1_outlined,
                size: 100,
                color: AppColors.primaryColor,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sign up to start receiving new requests.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff159a9c),
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
