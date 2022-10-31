import 'dart:io';

void main() {
  stdout.writeln('Cual es tu nombre?');
  var nombre = stdin.readLineSync();
  stdout.writeln('Cual es tu edad?');
  int edad = int.parse(stdin.readLineSync()!);
  int yearsFaltantes = 100 - edad;
  print("$nombre, a usted le faltan $yearsFaltantes");
}
