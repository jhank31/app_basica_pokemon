import 'package:app_basica_pokemon/dominio/pokemon/modelo/modelo_pokemon.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class PokemonFuenteDeDatos {
  Future<Either> buscarPokemon();
}

class ImplementacionPokemonFuenteDeDatos implements PokemonFuenteDeDatos {
  final Dio dio = Dio();
  @override
  Future<Either> buscarPokemon() async {
    try {
      var peticion =
          await dio.get('https://pokeapi.co/api/v2/pokemon?limit=30');
      final List<dynamic> results = peticion.data['results'];

      List<ModeloDePokemon> pokemons = [];
      for (var pokemon in results) {
        var detallePeticion = await dio.get(pokemon['url']);
        var detalleData = detallePeticion.data;

        // Crear el modelo de Pokémon con nombre e imagen
        pokemons.add(ModeloDePokemon(
          nombre: detalleData['name'],
          imagenesDePokemon: ImagenDePokemon(
            predeterminadaFrontal: detalleData['sprites']['front_default'],
          ),
        ));
      }
      return Right(pokemons);
    } catch (e) {
      return const Left('Error al obtener los pokemons');
    }
  }
}
