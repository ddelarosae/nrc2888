import 'dart:io';

void main() {
  stdout.write("ingrese un numero: ");
  int numero = int.parse(stdin.readLineSync()!);
  if (numero % 2 == 0) {
    stdout.write("El numero es par");
  } else {
    print("El numero es impar");
  }
}
