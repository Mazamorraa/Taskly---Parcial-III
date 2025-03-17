import 'package:equatable/equatable.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class LoadOrders extends OrdersEvent {}

class AddOrder extends OrdersEvent {
  final Solicitud solicitud;

  const AddOrder(this.solicitud);

  @override
  List<Object> get props => [solicitud];
}

class ShowLoading extends OrdersEvent {}
