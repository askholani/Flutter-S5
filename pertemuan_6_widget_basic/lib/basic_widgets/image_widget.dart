import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  // Key pada konstruktor widget memiliki beberapa fungsi penting, terutama dalam manajemen state dan identifikasi unik widget.
  // fungsi : manajement state, indetifikasi, reusability, dan animasi
  const MyImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage("logo_polinema.png"));
  }
}
