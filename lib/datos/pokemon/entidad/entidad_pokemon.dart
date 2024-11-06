

import 'package:app_basica_pokemon/dominio/pokemon/modelo/modelo_pokemon.dart';

class EntidadPokemon {
  final String nombre;
  final ImagenDePokemon imagen;

  const EntidadPokemon({
    required this.nombre,
    required this.imagen,
  });

  //? creamos un metodo para mapear el modelo a una entidad
  factory EntidadPokemon.fromModelo(ModeloDePokemon modelo) {
    return EntidadPokemon(
      nombre: modelo.nombre,
      imagen: ImagenDePokemon(
        predeterminadaFrontal: modelo.imagenesDePokemon?.predeterminadaFrontal,
      ),
    );
  }
}