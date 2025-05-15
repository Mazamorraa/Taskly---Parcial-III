import 'package:flutter/material.dart';
import 'package:proyecto_taskly/adapters/ui/servicioCompleto.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/size_config.dart';

//Metodod de textfield

class MyTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Color color;
  final double altura;
  final double ancho;
  final IconData? icon;
  final Color? iconColor;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.color,
    required this.altura,
    required this.ancho,
    required String label,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: SizedBox(
        height: getProportionateScreenHeight(altura),
        width: getProportionateScreenWidth(ancho),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            fillColor: AppColors.TextField,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: color, fontFamily: 'HammersmithOne'),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            suffixIcon: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

//metodo para textos
class MyText extends StatelessWidget {
  final String label;
  final double size;
  final Color color;
  final FontWeight fontWeight;

  const MyText({
    super.key,
    required this.label,
    required this.size,
    required this.color,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: 10,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'HammersmithOne',
      ),
    );
  }
}

// Metodo de botón
class MyButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final double altura;
  final double ancho;

  const MyButton({
    super.key,
    required this.text,
    this.onTap,
    required this.altura,
    required this.ancho,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(ancho),
        height: getProportionateScreenHeight(altura),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColors.Button,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'HammersmithOne',
            ),
          ),
        ),
      ),
    );
  }
}

//Metodo para las estrellas y el rating

class RatingStars extends StatelessWidget {
  final double rating;

  const RatingStars({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.black : Colors.black.withOpacity(0.3),
          size: 15.0,
        );
      }),
    );
  }
}

class Carta extends StatelessWidget {
  final String descripcion;
  final String numeroEspecialistas;
  final IconData icon;
  final VoidCallback onTap; // Callback personalizado

  const Carta({
    super.key,
    required this.descripcion,
    required this.numeroEspecialistas,
    required this.icon,
    required this.onTap, // Requiere callback para manejar onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Llamada al callback
      child: Container(
        margin: const EdgeInsets.all(8.0),
        width: getProportionateScreenWidth(150),
        height: getProportionateScreenHeight(160),
        decoration: BoxDecoration(
          color: AppColors.TextField,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 50,
                color: Colors.black87,
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  descripcion,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                numeroEspecialistas,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.Subtitulos,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Perfil extends StatelessWidget {
  final String nombre;
  final String descripcion;
  final String precio;

  const Perfil(
      {super.key,
      required this.nombre,
      required this.descripcion,
      required this.precio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      fontSize: 12, color: Colors.black54),
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

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(40),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.red,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: GestureDetector(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Serviciocompleto(
                            nombre: nombre,
                            descripcion: descripcion,
                            precio: precio,
                          ),
                        ),
                      ),
                      Navigator.pushReplacementNamed(
                          context, Serviciocompleto.routeName),
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        width: getProportionateScreenWidth(120),
                        height: getProportionateScreenHeight(40),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
