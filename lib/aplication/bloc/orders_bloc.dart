import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_event.dart';
import 'package:proyecto_taskly/aplication/bloc/orders_state.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';
import 'package:proyecto_taskly/domain/entities/solicitudes.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final PreferenciasTaskly prefs;

  OrdersBloc(this.prefs) : super(OrdersInitial()) {
    on<LoadOrders>(_onLoadOrders);
    on<AddOrder>(_onAddOrder);
    on<ShowLoading>(_onShowLoading);
  }

  Future<void> _onLoadOrders(
      LoadOrders event, Emitter<OrdersState> emit) async {
    emit(OrdersLoading());
    try {
      await prefs.initPrefs();
      final solicitudes = await prefs.getSolicitudes();
      emit(OrdersLoaded(solicitudes));
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  Future<void> _onAddOrder(AddOrder event, Emitter<OrdersState> emit) async {
    if (state is OrdersLoaded) {
      final List<Solicitud> updatedSolicitudes =
          List.from((state as OrdersLoaded).solicitudes)..add(event.solicitud);
      await prefs.saveSolicitudes(updatedSolicitudes);
      emit(OrdersLoaded(updatedSolicitudes));
    }
  }

  Future<void> _onShowLoading(
      ShowLoading event, Emitter<OrdersState> emit) async {
    emit(Loading());
    await Future.delayed(Duration(seconds: 2));
    emit(OrdersInitial());
  }
}
