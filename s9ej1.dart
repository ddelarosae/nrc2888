import 'dart:convert';

void main() {
  String archivoJSON = '{"nombre":"Alfredo","edad":28}';
  Map<String, dynamic> map = jsonDecode(archivoJSON);
  String nombre = map["nombre"];
  int edad = map["edad"];
  Person persona = Person(nombre, edad);
  print(persona.nombre);
  print(persona.edad);
}

class Person {
  Person(this.nombre, this.edad);
  final String nombre;
  final int edad;
}
