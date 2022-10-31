import 'package:dart_basics/converter.dart';

class MainConverter {
  // ignore: todo
  // TODO: Define dos varibles privadas String nulables: [binary] y [decimal]
  String? _binary;
  MainConverter() {
    // ignore: todo
    // TODO: Inicializa [binary] y [decimal] en ['0'] solo cuando sean nulos
    _binary ??= '0';
  }
  // ignore: todo
  // TODO: Crea un [setter] para [binary] con el parametro nulable.
  set binary(String? value) => _binary = value;
  String convertBinary() {
    // ignore: todo
    // TODO: Asegurate que [binary] no es nulo antes de intentar la conversion.
    // ignore: todo
    // TODO: Usa [Converter] para convertir el numero binario a un numero decimal.
    assert(_binary != null);
    return Converter.bin2dec(_binary!);
  }
}
