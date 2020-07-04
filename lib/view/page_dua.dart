import 'package:hive_app/model/monster.dart';
import 'package:hive_app/model/shop.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ShopHive Database App"),
        ),
        body: FutureBuilder(
          future: Hive.openBox("shop"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError)
                return Center(
                  child: Text(snapshot.error),
                );
              else {
                var shopBox = Hive.box("shop");
                if (shopBox.length == 0) {
                  shopBox.add(Shop("Baju", 1));
                  shopBox.add(Shop("Sepatu", 8));
                }
                return WatchBoxBuilder(
                  box: shopBox,
                  builder: (context, shop) => Container(
                    margin: EdgeInsets.all(20),
                    child: ListView.builder(
                      itemCount: shop.length,
                      itemBuilder: (context, index) {
                        Shop shops = shop.getAt(index);
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(3, 3),
                                blurRadius: 6)
                          ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(shops.name +
                                  " [" +
                                  shops.qty.toString() +
                                  "] "),
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    color: Colors.green,
                                    onPressed: () {
                                      shop.putAt(index,
                                          Shop(shops.name, shops.qty + 1));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.content_copy),
                                    color: Colors.grey,
                                    onPressed: () {
                                      shop.add(Shop(shops.name, shops.qty));
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                    onPressed: () {
                                      shop.deleteAt(index);
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ));
  }
}
