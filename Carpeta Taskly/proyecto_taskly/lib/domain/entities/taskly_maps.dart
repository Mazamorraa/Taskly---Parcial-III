// To parse this JSON data, do
//
//     final taskly = tasklyFromMap(jsonString);

import 'dart:convert';

import 'package:proyecto_taskly/domain/entities/cliente.dart';
Taskly tasklyFromJson(String str) => Taskly.fromJson(json.decode(str));

String tasklyToJson(Taskly data) => json.encode(data.toJson());

class Taskly {
    List<Cliente> clientes;

    Taskly({
        required this.clientes,
    });

    factory Taskly.fromJson(Map<String, dynamic> json) => Taskly(
        clientes: List<Cliente>.from(json["clientes"].map((x) => Cliente.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "clientes": List<dynamic>.from(clientes.map((x) => x.toJson())),
    };
}
