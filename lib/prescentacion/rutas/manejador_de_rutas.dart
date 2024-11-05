import 'package:app_basica_pokemon/prescentacion/vistas/exportar_vistas.dart';
import 'package:go_router/go_router.dart';

//* usamos GoRouter para manejar las rutas de la aplicación
final _configuracionDeRutas = GoRouter(
    /*
  *definimos las rutas de la aplicación donde cada item de la lista es una ruta 
  *que se asigna con la clase GoRoute
  */
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const VistaPrincipal(),
      )
    ]);

//? getter que retorna la configuración de rutas de la aplicación
GoRouter get configuracionDeRutas => _configuracionDeRutas;
