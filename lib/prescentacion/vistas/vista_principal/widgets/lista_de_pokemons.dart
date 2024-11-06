import 'package:app_basica_pokemon/prescentacion/vistas/vista_principal/bloc/bloc_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListaDePokemons extends StatelessWidget {
  const ListaDePokemons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
      child: BlocBuilder<BlocPokemon, EstadoPokemon>(builder: (context, state) {
        if (state is CargandoPokemons) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FalloAlCargarPokemons) {
          return Center(child: Text(state.message));
        } else {
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
            itemCount: state.pokemons.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(state.pokemons[index].nombre),
                leading: CircleAvatar(
                  child: Image(
                      image: NetworkImage(
                          state.pokemons[index].imagen.predeterminadaFrontal!)),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
