import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/propuestaEspecialista.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/drawer.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/size_config.dart';

class Peticionespecialista extends StatefulWidget {
  static const String routeName = 'peticiones';
  final String title;

  const Peticionespecialista({super.key, required this.title});

  @override
  State<Peticionespecialista> createState() => _PeticionespecialistaState();
}

class _PeticionespecialistaState extends State<Peticionespecialista> {
  get username => '';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.AppBarColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: Colors.teal),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Padding(padding: EdgeInsets.all(10)),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/img/taskly_logo.jpg',
                width: 100,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer_menu(username: username),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: MyText(
                    label: 'Submit your request to a professional',
                    size: 25,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Icono circular
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[200],
                            child: const Icon(
                              Icons.account_circle,
                              size: 70,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),

                        // Nombre y detalles
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                label: 'Sebastian Andrade Roa',
                                fontWeight: FontWeight.bold,
                                size: 30,
                                color: AppColors.black,
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Plumber ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Services 164',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '|',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      RatingStars(rating: 2),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '(4.3)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Descripción
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: MyText(
                      label:
                          'professional specialized in the installation, repair, and maintenance of piping systems that supply water...',
                      size: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.Subtitulos,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Botón de envío
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        width: getProportionateScreenWidth(450),
                        height: getProportionateScreenHeight(
                            55), 
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          color: AppColors.Button,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'HammersmithOne',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyButton(
              text: 'Your request',
              altura: 70,
              ancho: 400,
              onTap: () {
                Navigator.pushReplacementNamed(context, PropuestaEspecialista.routeName);
              },
            ),
          ),
        ],
      ),
    ));
  }
}
