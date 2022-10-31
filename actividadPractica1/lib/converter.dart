abstract class Converter {
  static String bin2dec(String binary) {
    //ignore: todo
    // TODO: convierte [binary] en un [int] de base 2 y luego conviertelo a base 10
    return int.parse(binary, radix: 2).toRadixString(10);
  }
}
