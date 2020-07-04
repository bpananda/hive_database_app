import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Monster {
  @HiveField(0)
  String name;
  @HiveField(1)
  int level;

  Monster() {
    name = "JELLYDRINK";
    level = 5;
  }
}
