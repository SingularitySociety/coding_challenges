import 'dart:math';

void main() {

  List<List<String>> list = [[]];

  for (var i = 0; i < 5; i++) {  // 桁数
    for (var j = 0; j < (pow(2, (i + 1))); j++) {
      list.add(j.toRadixString(2).padLeft((i + 1), "0").split(''));
    }
  }

  print(list);
}