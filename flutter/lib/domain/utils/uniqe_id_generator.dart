import 'dart:math';

class UniqueIdGenerator {
  static int generateUniqueId() {
    int timestampMicros = DateTime.now().microsecondsSinceEpoch;
    int randomNum = Random().nextInt(9999999);
    return timestampMicros + randomNum;
  }
}
