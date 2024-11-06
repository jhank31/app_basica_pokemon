part of 'bloc_pokemon.dart';

//* una saled class es una clase que no puede ser extendida
//* y que no puede ser instanciada, es decir no se puede hacer un new de ella
//* se usa para definir un conjunto de subclases que son las únicas que pueden existir
//* en este caso EventosPokemon solo puede tener las subclases PokemonCargado
//* y no puede ser instanciada
sealed class EstadoPokemon extends Equatable {
  final List<EntidadPokemon> pokemons;
  const EstadoPokemon(this.pokemons);

  @override
  List<Object> get props => [];
}

// establecemos el estado inicial del bloc
class CargandoPokemons extends EstadoPokemon {
  const CargandoPokemons(super.pokemons);
}

// establecemos el estado de error al cargar los pokemons
class FalloAlCargarPokemons extends EstadoPokemon {
  final String message;

  const FalloAlCargarPokemons(super.pokemons, {required this.message});
}

// establecemos el estado de cargado de los pokemons
class PokemonsCargados extends EstadoPokemon {
  final List<EntidadPokemon?> listadePokemons;

  const PokemonsCargados(super.pokemons, {this.listadePokemons = const []});

  PokemonsCargados copyWith({
    List<EntidadPokemon?>? listadePokemons,
  }) {
    return PokemonsCargados(
      pokemons,
      listadePokemons: listadePokemons ?? this.listadePokemons,
    );
  }

  @override
  List<Object> get props => [pokemons];
}
