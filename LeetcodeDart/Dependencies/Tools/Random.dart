import 'dart:math';

extension Int on int {
  // 生成[min, max]之前的随机数
  static int random(int min, int max) {
    final res = min + Random().nextInt(max - min + 1);
    return res;
  }
}
