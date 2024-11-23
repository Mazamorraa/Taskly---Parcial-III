import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/peticionEspecialista.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/drawer.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/size_config.dart';

class Llenardatos extends StatefulWidget {
  static const String routeName = 'LlenarDatos';
  final String title;
  
  const Llenardatos({super.key, required this.title});

  @override
  State<Llenardatos> createState() => _LlenardatosState();
}

class _LlenardatosState extends State<Llenardatos> {
  TextEditingController descripcionController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  DateTime? fechaController;
  TextEditingController priceController = TextEditingController();
  final String servicio = 'Service';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
        drawer: Drawer_menu(username: ''),
        
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Column(
            children: [
              Row(children: [
                GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, MyHomePage.routeName);
              
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.black, 
              size: 25,
          ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyText(label: servicio, size: 25, color: AppColors.black, fontWeight: FontWeight.bold),
                )
              ],),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // label
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                              label: 'Whats need to be done?',
                              size: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
              
                      // User text field
                      MyTextfield(
                        controller: descripcionController,
                        hintText: '',
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
                              label: 'Where to do the work?',
                              size: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
              
                      // User text field
                      Align(
                        alignment: Alignment.center,
                        child: MyTextfield(
                          controller: direccionController,
                          hintText: '',
                          obscureText: false,
                          color: AppColors.Subtitulos,
                          altura: 50,
                          ancho: 350,
                          label: 'hola',
                          icon: Icons.abc,
                          iconColor: AppColors.TextField,
                        ),
                      ),
                      const SizedBox(height: 30),
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        const MyText(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          label: 'When need to be done?',
                          size: 20,
                        ),
                        Icon(Icons.calendar_month, size: 20,)
                        
                      ]),
                      SizedBox(height: 55,),
              
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: MyText(
                              label: 'How much are you ready to pay',
                              size: 20,
                              color: AppColors.black,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
              
                      Align(
                        alignment: Alignment.center,
                        child: MyTextfield(
                          controller: priceController,
                          hintText: 'Offer your price',
                          obscureText: false,
                          color: AppColors.Subtitulos,
                          altura: 50,
                          ancho: 350,
                          label: 'hola',
                          icon: Icons.attach_money,
                          iconColor: AppColors.black,
                        ),
                      ),
                      SizedBox(height: 100,),
              
              
              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton(
                            text: 'Search',
                            altura: 60,
                            ancho: 100,
                            onTap: () {
                              Navigator.pushReplacementNamed(context, Peticionespecialista.routeName);
                            },
                          ),
                        ],
                      )
              
                      // Log in button
                    ],
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
