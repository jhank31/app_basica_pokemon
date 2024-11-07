
import 'package:app_basica_pokemon/pokemon/datos/entidad/entidad_pokemon.dart';
import 'package:app_basica_pokemon/pokemon/dominio/casos_de_uso/obtener_pokemons.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eventos_pokemon.dart';
part 'estado_pokemon.dart';

/* esta es la estrucura basica de nuestro bloc que extiende de la clase Bloc
 y recibe dos parametros, el primero es el evento que se va a recibir y el segundo es el estado que se va a emitir
 en este caso el evento es EventosPokemon y el estado es EstadoPokemon */
class BlocPokemon extends Bloc<EventosPokemon, EstadoPokemon> {
  final ObtenerPokemons _obtenerPokemons;
  // inicializamos el estado del bloc con el estado inicial
  // creamos el constructor de esta manera para que el estado inicial sea PokemonInicial
  BlocPokemon({required ObtenerPokemons obtenerPokemons})
      : _obtenerPokemons = obtenerPokemons,
        super(const CargandoPokemons([])) {
    // este es el metodo que se ejecuta cuando se emite un evento
    // esta es la manera tradicional de hacerlo, pero tambien se puede hacer con un handler
    on<CargarPokemons>((event, emit) async {
      try {
        emit(const CargandoPokemons([]));
        var pokemons = await _obtenerPokemons.ejecutar();
        pokemons.fold(
          (error) => emit(FalloAlCargarPokemons(const [], message: error)),
          (datos) => emit(PokemonsCargados(datos, listadePokemons: datos)),
        );
      } catch (e) {
        //? asi se lanza una excepción en dart para indicar que algo salio mal en el try
        throw Exception('Error al obtener los pokemons ---- $e');
      }

      //? asi se implementa un handler para manejar los eventos
      // _obtenerPokemonEncabezado(event, emit);
    });
  }

  //? en este caso se usa un handler para manejar los eventos
  //? en lugar de usar el metodo on
  //@protected
  //* la palabra reservada protected se usa para indicar que el metodo solo puede ser accedido por la clase que lo contiene
  // void _obtenerPokemonEncabezado(CargarPokemons evento, Emitter<EstadoPokemon> emit) async {
  //   try {
  //       var pokemons = await _buscarPokemon();
  //       return pokemons.fold(
  //         (error) => emit(FalloAlCargarPokemons(message: error)),
  //         (datos) => emit(PokemonsCargados(pokemons: datos)),
  //       );
  //     } catch (e) {
  //       //? asi se lanza una excepción en dart para indicar que algo salio mal en el try
  //       throw Exception('Error al obtener los pokemons ---- $e');
  //     }
  // }
}
