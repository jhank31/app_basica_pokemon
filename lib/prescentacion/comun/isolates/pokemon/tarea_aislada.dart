


import 'dart:isolate';

import 'package:app_basica_pokemon/datos/pokemon/fuente_de_datos/pokemon_fuente_de_datos.dart';

Future<void> tareaAislada(SendPort port, PokemonFuenteDeDatos pokemonFuenteDeDatos) async {
  var dataARetornar = await pokemonFuenteDeDatos.buscarPokemon();
  port.send(dataARetornar);
}