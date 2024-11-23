import 'package:flutter/material.dart';
import 'package:proyecto_taskly/components/colors.dart';
import 'package:proyecto_taskly/components/widgets.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.White,
            body: Column(
              children: [
                Padding(padding: EdgeInsets.all(10),
                child: MyText(
                  label: 'My Orders',
                  size: 35,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
                
                
                )
              ],
            )));
  }
}
