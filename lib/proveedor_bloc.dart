import 'package:app_basica_pokemon/inyeccion_de_dependencias.dart';
import 'package:app_basica_pokemon/pokemon/bloc/bloc_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProveedorBloc extends StatelessWidget {
  final Widget child;
  const ProveedorBloc({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // se usa el widget MultiBlocProvider para proveer de multiples blocs a la aplicacion
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // se usa el operador .. para encadenar metodos tambien conocido como operador cascada
          create: (_) =>
              inyeccionDeDependencias<BlocPokemon>()..add(CargarPokemons()),
        ),
      ],
      child: child,
    );
  }
}
