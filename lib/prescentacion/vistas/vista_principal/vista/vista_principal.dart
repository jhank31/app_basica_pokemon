import 'package:app_basica_pokemon/prescentacion/vistas/vista_principal/widgets/widgets.dart';
import 'package:flutter/material.dart';

class VistaPrincipal extends StatelessWidget {
  const VistaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Pokemons',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const ListaDePokemons(),
    );
  }
}
