//? la palabra part of se usa para indicar que el archivo actual es parte de otro archivo
part of 'bloc_pokemon.dart';

sealed class EventosPokemon extends Equatable {
  // extendemos de la clase Equatable para poder comparar objetos de esta clase
  const EventosPokemon();

  @override
  List<Object> get props => [];
}

final class CargarPokemons extends EventosPokemon {}
