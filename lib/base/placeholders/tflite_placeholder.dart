/// needed to ensure compilation on web since tflite package is not supported
class Interpreter {
  Interpreter();

  static Future<Interpreter> fromAsset(String assetName) async {
    return Interpreter();
  }

  run(List<int> tokens, List output) {}
}

extension ListShape on List {
  List reshape<T>(List<int> shape) {
    return [];
  }
}
