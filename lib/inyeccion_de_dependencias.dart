import 'package:app_basica_pokemon/pokemon/datos/fuente_de_datos/pokemon_fuente_de_datos.dart';
import 'package:app_basica_pokemon/pokemon/datos/repositorio/implementacion_repositorio_pokemon.dart';
import 'package:app_basica_pokemon/pokemon/dominio/casos_de_uso/obtener_pokemons.dart';
import 'package:app_basica_pokemon/pokemon/dominio/repositorio/respositorio_pokemon.dart';
import 'package:app_basica_pokemon/pokemon/bloc/bloc_pokemon.dart';
import 'package:get_it/get_it.dart';

GetIt inyeccionDeDependencias = GetIt.instance;

Future<void> inicializarInyeccionDeDependencias() async {
  //* Servicios
  //? servicio de red para obtener los pokemon de la API
  inyeccionDeDependencias.registerSingleton<PokemonFuenteDeDatos>(
      ImplementacionPokemonFuenteDeDatos());

  //* Repositorios
  //? repositorio de pokemon
  inyeccionDeDependencias.registerSingleton<RepositorioPokemon>(
      ImplementacionRepositorioPokemon());

  //* Casos de uso
  //? caso de uso para obtener los pokemons
  inyeccionDeDependencias.registerSingleton<ObtenerPokemons>(ObtenerPokemons());

  //* Blocs
  //? bloc de pokemon
  inyeccionDeDependencias.registerSingleton(
      BlocPokemon(obtenerPokemons: inyeccionDeDependencias<ObtenerPokemons>()));
}
