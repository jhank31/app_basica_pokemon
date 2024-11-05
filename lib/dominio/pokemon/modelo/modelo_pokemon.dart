class ModeloDePokemon {
  final String nombre;
  //? hacemos que la clase ImagenesDePokemon sea opcional
  final ImagenesDePokemon? imagenesDePokemon;

  ModeloDePokemon({
    required this.nombre,
    this.imagenesDePokemon,
    // podemos inicializar la propiedad imagenesDePokemon con un valor predeterminado
    // this.imagenesDePokemon = "{https://url_ejemplo.com/imagen.png, https://url_ejemplo.com/imagen2.png}",
  });

  //* el metodo copyWith nos permite crear una copia de la instancia actual de la clase
  //* y modificar los valores que deseamos
  ModeloDePokemon copyWith({
    String? nombre,
    ImagenesDePokemon? imagenesDePokemon,
  }) =>
      ModeloDePokemon(
        nombre: nombre ?? this.nombre,
        imagenesDePokemon: imagenesDePokemon ?? this.imagenesDePokemon,
      );
}

class ImagenesDePokemon {
  final String? predeterminadaFrontal;

  ImagenesDePokemon({
    this.predeterminadaFrontal,
  });

  ImagenesDePokemon copyWith({
    String? predeterminadaFrontal,
  }) =>
      ImagenesDePokemon(
        predeterminadaFrontal:
            predeterminadaFrontal ?? this.predeterminadaFrontal,
      );
}
