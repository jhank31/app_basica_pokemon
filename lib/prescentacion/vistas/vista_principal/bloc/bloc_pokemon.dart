import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'eventos_pokemon.dart';
part 'estado_pokemon.dart';

class BlocPokemon extends Bloc<EventosPokemon, EstadoPokemon> {
  BlocPokemon() : super(PokemonInicial()) {
    on<EventosPokemon>((event, emit) {
      // TODO: implement event handler
    });
  }
}
