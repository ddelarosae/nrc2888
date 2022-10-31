/*
4.	Tome una lista, digamos por ejemplo esta:
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
y escriba un programa que imprima todos los elementos de la lista que sean menores que 5.
*/
void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  for (int i in a) {
    if (i < 5) {
      print(i);
    }
  }
  print([
    for (int i in a)
      if (i < 5) i
  ]);
}
