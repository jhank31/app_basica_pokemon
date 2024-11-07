import 'package:app_basica_pokemon/inyeccion_de_dependencias.dart';
import 'package:app_basica_pokemon/temas/tema_de_la_aplicacion.dart';
import 'package:app_basica_pokemon/compartidos/rutas/manejador_de_rutas.dart';
import 'package:app_basica_pokemon/proveedor_bloc.dart';
import 'package:flutter/material.dart';

void main() async {
  //* esta funcion de WidgetsFlutterBinding.ensureInitialized() es necesaria para inicializar el motor de flutter
  WidgetsFlutterBinding.ensureInitialized();
  await inicializarInyeccionDeDependencias();
  runApp(const ProveedorBloc(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: configuracionDeRutas,
      theme: TemaDeLaAplicacion().obtenerTema(),
    );
  }
}
