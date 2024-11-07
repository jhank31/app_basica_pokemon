
//? creamos una clase abstracta CasoDeUso que recibe dos tipos de datos
//? Type y Params, donde Type es el tipo de dato que retornará el método ejecutar
//? y Params es el tipo de dato que recibirá el método ejecutar
abstract class CasoDeUso<Type, Params> {
  //* ponemos params entre llaves para indicar que son parametros por nombre
  Future<Type> ejecutar({Params params});
}