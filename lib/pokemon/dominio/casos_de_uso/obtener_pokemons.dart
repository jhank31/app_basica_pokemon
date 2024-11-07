import 'package:app_basica_pokemon/pokemon/dominio/repositorio/respositorio_pokemon.dart';
import 'package:app_basica_pokemon/inyeccion_de_dependencias.dart';
import 'package:app_basica_pokemon/comun/caso_de_uso/caso_de_uso.dart';

class ObtenerPokemons implements CasoDeUso {
  @override
  Future ejecutar({params}) async {
    return await inyeccionDeDependencias<RepositorioPokemon>().buscarPokemon();
  }
}
