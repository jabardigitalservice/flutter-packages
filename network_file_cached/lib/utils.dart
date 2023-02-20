import 'dart:math';

class Utils {
  static String getRandomString() {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    return String.fromCharCodes(Iterable.generate(
        25, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
  }
}
