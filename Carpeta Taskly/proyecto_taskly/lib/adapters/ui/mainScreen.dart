import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_taskly/adapters/ui/login.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_bloc.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_event.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_state.dart';
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
          child: BlocConsumer<OrdersBloc, OrdersState>(
            listener: (context, state) {
              if (state is OrdersInitial) {
                Navigator.pushReplacementNamed(context, Login.routeName);
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return CircularProgressIndicator();
              }
              return Column(
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
                      context.read<OrdersBloc>().add(ShowLoading());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
