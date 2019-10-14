import 'dart:math';

class AppConstants {
  static const appName = "Hello Shop";
}

class AppFunctions {
  static const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

  static String randomString(int strlen) {
    Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
    String result = "";
    for (var i = 0; i < strlen; i++) {
      result += chars[rnd.nextInt(chars.length)];
    }
    return result;
  }
}
