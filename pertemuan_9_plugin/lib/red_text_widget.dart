import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RedTextWidget extends StatelessWidget {
  final String text;
  // konstruktor kelas : menyiapkan objek dan melakukan tugas inisialisasi yang diperlukan sebelum objek dapat digunakan.
  // menerima parameter opsional "Key" : untuk mengidentifikasi widget.
  // super(key: key) memanggil konstruktor kelas induk (StatelessWidget) dengan memberikan kunci sebagai parameter.
  const RedTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(text,
        style: const TextStyle(color: Colors.red, fontSize: 14),
        maxLines: 2,
        overflow: TextOverflow.ellipsis);
  }
}
