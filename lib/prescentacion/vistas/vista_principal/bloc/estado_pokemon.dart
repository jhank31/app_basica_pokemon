part of 'bloc_pokemon.dart';

sealed class EstadoPokemon extends Equatable {
  const EstadoPokemon();

  @override
  List<Object> get props => [];
}

final class PokemonInicial extends EstadoPokemon {}
