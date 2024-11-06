class ModeloDePokemon {
  final String nombre;
  //? hacemos que la clase ImagenesDePokemon sea opcional
  final ImagenDePokemon? imagenesDePokemon;

  const ModeloDePokemon({
    required this.nombre,
    this.imagenesDePokemon,
  });

  //* el metodo fromJson nos permite crear una instancia de la clase a partir de un mapa
  //* que contiene los valores de las propiedades de la clase
  factory ModeloDePokemon.fromJson(Map<String, dynamic> json) {
    return ModeloDePokemon(
      nombre: json['name'],
      imagenesDePokemon: ImagenDePokemon(
        predeterminadaFrontal: json['sprites']['front_default'],
      ),
    );
  }

  //* metodo toJson que nos permite convertir una instancia de la clase a un mapa
  Map<String, dynamic> toJson() {
    return {
      'name': nombre,
      'sprites': {
        'front_default': imagenesDePokemon?.predeterminadaFrontal,
      },
    };
  }

  //* el metodo copyWith nos permite crear una copia de la instancia actual de la clase
  //* y modificar los valores que deseamos
  ModeloDePokemon copyWith({
    String? nombre,
    ImagenDePokemon? imagenesDePokemon,
  }) =>
      ModeloDePokemon(
        nombre: nombre ?? this.nombre,
        imagenesDePokemon: imagenesDePokemon ?? this.imagenesDePokemon,
      );
}

class ImagenDePokemon {
  final String? predeterminadaFrontal;

  ImagenDePokemon({
    // podemos inicializar la propiedad predeterminadaFrontal con un valor predeterminado
    // this.predeterminadaFrontal = "{https://url_ejemplo.com/imagen.png, https://url_ejemplo.com/imagen2.png}",
    this.predeterminadaFrontal =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
  });

  ImagenDePokemon copyWith({
    String? predeterminadaFrontal,
  }) =>
      ImagenDePokemon(
        predeterminadaFrontal:
            predeterminadaFrontal ?? this.predeterminadaFrontal,
      );
}
