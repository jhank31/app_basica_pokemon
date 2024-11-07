import 'dart:async';
import 'dart:isolate';
import 'package:app_basica_pokemon/pokemon/datos/entidad/entidad_pokemon.dart';
import 'package:app_basica_pokemon/pokemon/dominio/repositorio/respositorio_pokemon.dart';
import 'package:app_basica_pokemon/inyeccion_de_dependencias.dart';
import 'package:app_basica_pokemon/comun/isolates/pokemon/tarea_aislada.dart';
import 'package:app_basica_pokemon/pokemon/datos/fuente_de_datos/pokemon_fuente_de_datos.dart';
import 'package:dartz/dartz.dart';

class ImplementacionRepositorioPokemon implements RepositorioPokemon {
  @override
  Future<Either> buscarPokemon() async {
    Either<dynamic, dynamic> datosARetornar =
        const Left('Ocurrio un error al obtener los pokemons');

    ReceivePort receivePort = ReceivePort();
    final pokemonFuenteDeDatos =
        inyeccionDeDependencias<PokemonFuenteDeDatos>();

    Isolate isolate = await Isolate.spawn(
      (argumentos) async {
        //? Se recibe el SendPort y el PokemonFuenteDeDatos
        final sendPort = argumentos[0] as SendPort;
        final pokemonFuenteDeDatos = argumentos[1] as PokemonFuenteDeDatos;
        tareaAislada(sendPort, pokemonFuenteDeDatos);
      },
      [receivePort.sendPort, pokemonFuenteDeDatos],
    );

    // se usa un Completer para esperar el resultado
    Completer<Either<dynamic, dynamic>> completer = Completer();

    receivePort.listen((data) {
      completer.complete(data); // Completa el futuro con el resultado
      receivePort.close();
      isolate.kill();
    });

    // Esperar el resultado del Completer
    datosARetornar = await completer.future;

    return datosARetornar.fold(
      (error) => Left(error),
      (datos) {
        return Right(
          List.from(datos)
              .map((modeloDePokemon) =>
                  EntidadPokemon.fromModelo(modeloDePokemon))
              .toList(),
        );
      },
    );
  }
}
