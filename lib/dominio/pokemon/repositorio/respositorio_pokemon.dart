import 'package:dartz/dartz.dart';

abstract class RespositorioPokemon {
  Future<Either> buscarPokemon();
}
