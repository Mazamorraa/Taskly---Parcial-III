import 'package:equatable/equatable.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

class OrdersInitial extends OrdersState {}

class OrdersLoading extends OrdersState {}

class OrdersLoaded extends OrdersState {
  final List<Solicitud> solicitudes;

  const OrdersLoaded(this.solicitudes);

  @override
  List<Object> get props => [solicitudes];
}

class OrdersError extends OrdersState {
  final String message;

  const OrdersError(this.message);

  @override
  List<Object> get props => [message];
}

class Loading extends OrdersState {}
