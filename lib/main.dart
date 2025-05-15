import 'package:flutter/material.dart';
import 'package:proyecto_taskly/MyApp.dart';
import 'package:proyecto_taskly/share_pref/preferenciasTaskly.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PreferenciasTaskly();
  await prefs.initPrefs();
  runApp(const MyApp());
}
