import 'package:hive/hive.dart';
part 'shop.g.dart';

@HiveType(typeId: 1)
class Shop {
  @HiveField(0)
  String name;
  @HiveField(1)
  int qty;

  Shop(this.name, this.qty);
}
