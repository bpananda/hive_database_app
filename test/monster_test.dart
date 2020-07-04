import 'package:flutter_test/flutter_test.dart';
import 'package:hive_app/model/monsterss.dart';
import 'package:hive_app/model/shop.dart';

void main() {
  group("Pengetesan class Monsters", () {
    Monster m;
    m = Monster();

    Shop s;
    s = Shop("Baju", 5);
    test("Inisialisasi Monster", () {
      print("test 1");
      expect(m.name, equals("JELLYDRINK"));
      expect(m.level, equals(5));
    });

    test("Value Harus Positif", () {
      print("test 2");
      s.qty = 5;
      expect(s.qty, isPositive);
    });

    setUp(() {
      print("set up");
    });

    tearDown(() {
      print("tear down");
    });
  });
}
