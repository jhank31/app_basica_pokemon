import 'package:dartz/dartz.dart';

abstract class RepositorioPokemon {
  Future<Either> buscarPokemon();
}
