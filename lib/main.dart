import 'package:flutter/material.dart';
import 'package:hive_app/model/shop.dart';
import 'package:hive_app/view/main_page.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive/hive.dart';
import 'package:hive_app/view/page_dua.dart';

import 'model/monster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var appDocumentDirectory =
      await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(MonsterAdapter());
  Hive.registerAdapter(ShopAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/second': (BuildContext _) => SecondPage(),
      },
      home: MainPage(),
    );
  }
}
