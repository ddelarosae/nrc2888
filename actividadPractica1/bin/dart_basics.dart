import 'dart:io';
import 'package:dart_basics/main.dart';

void main(List<String> arguments) {
  // ignore: todo
  // TODO: Instancia [MainConverter]
  final converter = MainConverter();
  print("Convertir:");
  print("1. Binario a Decimal");
  print("2. Decimal a Binario");
  // ignore: todo
  // TODO: Lee la entrada del usuario y conviertela en entero
  int opcion = int.parse(stdin.readLineSync()!);
  if (opcion == 1) {
    // ignore: todo
    //TODO: Escribe la condicion adecuada para ingresar cuando se escoga 'Binario a Decimal' */
    print("Escribe el numero binario:");
    converter.binary = stdin.readLineSync();
    print('Dato Convertido a Decimal: ${converter.convertBinary()}');
  }
}
