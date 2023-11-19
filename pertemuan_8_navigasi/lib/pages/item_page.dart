import 'package:flutter/material.dart';
import 'package:pertemuan_8_navigasi/models/item.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
        title: Text("ITEM PAGE"),
      ),
      body: Center(
          child: Column(
        children: [
          Text(itemArgs.name.toString()),
          Text(itemArgs.price.toString()),
        ],
      )),
    );
    throw UnimplementedError();
  }
}
