import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pertemuan_8_navigasi/pages/home_page.dart';
import 'package:pertemuan_8_navigasi/pages/item_page.dart';

void main() {
  // runApp(const MyApp());
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => HomePage(),
    '/item': (context) => ItemPage()
  }));
}
