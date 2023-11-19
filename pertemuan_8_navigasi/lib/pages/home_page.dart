import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pertemuan_8_navigasi/models/item.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(name: "Sugar", price: 5000),
    Item(name: 'Salt', price: 2000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Home Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        // istView.builder:  membuat daftar (list) dinamis yang hanya memuat elemen yang terlihat di layar.
        // Dalam hal ini untuk menampilkan daftar item menggunakan data dari list items.
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: items.length,
          // itemBuilder : fungsi yang dipanggil untuk setiap item dalam daftar.
          // Digunakan untuk membuat widget yang akan ditampilkan di posisi tertentu dalam daftar.
          itemBuilder: (context, index) {
            final item = items[index];
            // Card: mengelompokkan informasi ke dalam sebuah kartu, memberikan tampilan yang bersih dan terstruktur.
            return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/item', arguments: item);
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(child: Text(item.name)),
                        Expanded(
                            child: Text(
                          item.price.toString(),
                          textAlign: TextAlign.end,
                        ))
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
    throw UnimplementedError();
  }
}
