/*
5.	Genera un número aleatorio entre 1 y 100. Pídale al usuario que adivine el número, luego dígale si adivinó demasiado bajo, demasiado alto o exactamente correcto.
*/
//lo primero es el main
//Antes de comparar, generar el número random
//final int num = Random().nextInt(100) + 1;
import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  int randomNumber = random.nextInt(100) + 1;
  //final int num = Random().nextInt(100);
  print(randomNumber);
  int intentos = 0;
  while (true) {
    intentos += 1;
    print("Ingrese un numero entre 1 y 100\n");
    String sc = stdin.readLineSync()!;
    if (sc.toLowerCase() == "salir") {
      print("chao");
      break;
    } else if (int.parse(sc) > 100 || int.parse(sc) < 1) {
      // se agrega control para números menores a 1 con el ||(or)
      print("su numero no puede ser mayor que 100 ni menor que 1");
      continue;
    }
    if (int.parse(sc) == randomNumber) {
      print("usted ha ganado, en $intentos intentos");
      randomNumber =
          random.nextInt(100) + 1; // para cambiar el  número una vez ha ganado
      continue;
    }
    if (int.parse(sc) > randomNumber) {
      print("su numero es muy alto");
      continue;
    } else {
      print("su numero es muy bajo");
      continue;
    }
  }
}
