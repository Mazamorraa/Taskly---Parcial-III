import 'package:flutter/material.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/drawer.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';
import 'package:proyecto_taskly/size_config.dart';

class PropuestaEspecialista extends StatefulWidget {
  static const String routeName = 'propuesta';
  final String title;

  final Usuario usuario;

  const PropuestaEspecialista({super.key, required this.title, required this.usuario});

  @override
  State<PropuestaEspecialista> createState() => _PropuestaEspecialistaState();
}

class _PropuestaEspecialistaState extends State<PropuestaEspecialista> {
  final String direccion = '';
  final String descripcion = '';

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
        drawer: Drawer_menu(
          username: widget.usuario.nombre,
          usuario: widget.usuario,
        ),
        body: Column(
          children: [
            // Sección desplazable
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Perfil(
                          nombre: 'Sebastian Andrade Roa',
                          descripcion: '',
                          precio: ''),
                      Perfil(nombre: 'Juan Camilo Berdugo', descripcion: '', precio: ''),
                      Perfil(nombre: 'Emilio Andres Geiler Ariza', descripcion: '', precio: ''),
                    ],
                  ),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(300),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Expanded(
                child: SingleChildScrollView(
                child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 8),
                        child: MyText(
                            label: 'Service',
                            size: 20,
                            color: AppColors.Subtitulos,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[200],
                          child: const Icon(
                            Icons.account_circle,
                            size: 70,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 25),
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
                                children: [
                                  RatingStars(rating: 2),
                                  SizedBox(width: 5),
                                  Text(
                                    '(4.3)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyText(
                              label: 'Calle falsa 82',
                              size: 20,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.workspace_premium,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: MyText(
                                label:
                                    'professional specialized in the installation, repair, and maintenance of piping systems that supply water...',
                                size: 20,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
