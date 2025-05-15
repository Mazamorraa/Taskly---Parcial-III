// filepath: c:\Users\RYZEN\Desktop\proyecto taskly\Taskly---Parcial-III\Carpeta Taskly\proyecto_taskly\lib\adapters\ui\llenarSolicitud.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_taskly/adapters/ui/HomePage.dart';
import 'package:proyecto_taskly/adapters/ui/peticionEspecialista.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/drawer.dart';
import 'package:proyecto_taskly/components/widgets.dart';
import 'package:proyecto_taskly/domain/entities/cliente.dart';
import 'package:proyecto_taskly/domain/entities/especialista.dart';
import 'package:proyecto_taskly/domain/entities/servicio.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';
import 'package:proyecto_taskly/domain/entities/usuario.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';
import 'package:proyecto_taskly/size_config.dart';

class Llenardatos extends StatefulWidget {
  static const String routeName = 'LlenarDatos';
  final String title;
  final Usuario usuario;
  final String servicioSeleccionado;

  const Llenardatos(
      {super.key,
      required this.title,
      required this.usuario,
      required this.servicioSeleccionado});

  @override
  State<Llenardatos> createState() => _LlenardatosState();
}

class _LlenardatosState extends State<Llenardatos> {
  TextEditingController descripcionController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  late DateTime? fechaController = DateTime.now();
  TextEditingController priceController = TextEditingController();
  final String servicio = 'Service';

  get usuarioRepository => null;

  Future<void> _registrarSolicitud() async {
    // Validar
    if (descripcionController.text.isEmpty ||
        direccionController.text.isEmpty ||
        priceController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, complete todos los campos'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final PreferenciasTaskly prefs = PreferenciasTaskly();
      await prefs.initPrefs();
      Cliente? cliente = await prefs.getCliente();

      if (cliente == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error: No se encontró información del cliente.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // Crear la instancia de Servicio
      final nuevoServicio = Servicio(
        id: DateTime.now().millisecondsSinceEpoch,
        nombre: widget.servicioSeleccionado,
        descripcion: descripcionController.text,
        precio: int.parse(priceController.text),
      );

      // Crear una instancia vacía de Especialista
      Especialista especialistaVacio = Especialista(
        id: 0,
        nombre: '',
        email: '',
        contrasena: '',
        telefono: '',
        direccion: '',
        calificacion: 0,
        solicitudes: [],
        profesion: '',
        servicios: [],
      );
      final nuevaSolicitud = Solicitud(
        id: DateTime.now().millisecondsSinceEpoch,
        estado: 'Activo',
        precioFinal: double.parse(priceController.text),
        fechaSolicitud: DateTime.now(),
        direccion: direccionController.text,
        cliente: cliente,
        especialista: especialistaVacio,
        servicio: nuevoServicio,
      );

      setState(() {
        cliente.solicitudes.add(nuevaSolicitud);
      });

      await prefs.saveSolicitudes(cliente.solicitudes);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Solicitud registrada exitosamente'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacementNamed(context, Peticionespecialista.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al registrar la solicitud: ${e.toString()}'),
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
        drawer: Drawer_menu(
          username: widget.usuario.nombre,
          usuario: widget.usuario,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, MyHomePage.routeName);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.black,
                      size: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyText(
                        label: servicio,
                        size: 25,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
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

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                            label: 'When should it be done?',
                            size: 20,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      ListTile(
                        title: Text(
                          fechaController == null
                              ? 'Add a date'
                              : DateFormat('yyyy-MM-dd')
                                  .format(fechaController!),
                        ),
                        trailing: const Icon(Icons.edit_calendar),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              fechaController = pickedDate;
                            });
                          }
                        },
                      ),

                      /*const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        MyText(
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                          label: 'When need to be done?',
                          size: 20,
                        ),
                        Icon(Icons.calendar_month, size: 20,)
                        
                      ]),*/
                      const SizedBox(
                        height: 55,
                      ),

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
                      const SizedBox(
                        height: 100,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MyButton(
                            text: 'Search',
                            altura: 60,
                            ancho: 100,
                            onTap: () {
                              _registrarSolicitud();
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
