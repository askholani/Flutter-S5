import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Ibnu Hajar Askholani - 2141720170',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ibnu Hajar Askholani - 2141720170'),
        ),
        body: Center(
          child: ListView(
            // mainAxisAlignment === item-start/center/dll
            // mengatur posisi widget secara vertikal
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/kawah.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              TitleSection(), // Gunakan widget TitleSection di sini
              ButtonSection(),
              TextSection()
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Expanded === flex-grow/flex-shirnk
          // mengisi ruang semaksimal mungkin berdasarkan lebar layar
          Expanded(
            // Column === flex-col (tailwind)
            child: Column(
              // CrossAxisAligment === justify (tailwind)
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: const Text(
                    'Wisata Kawah Ijen',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kabupaten Banjuwangi, Jawa Timur',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            // Row === flex (menyusun secara horizontal)
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                const Text('41'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Kawah Ijen adalah sebuah kawah vulkanik yang terletak di kompleks Gunung Ijen1. Kawah ini terkenal karena keindahan alamnya yang luar biasa, dan terutama karena fenomena “blue fire” yang hanya dapat ditemukan di beberapa tempat di dunia1. Blue fire adalah hasil dari pembakaran belerang yang terjadi di dalam kawah pada malam hari1',
        //  softWrap : menentukan "wrap" pada text
        // true : pindah ke baris berikutnya jika tidak muat.
        // false : tidak pindah memungkinkan text terpotong
        softWrap: true,
      ),
    );
  }
}
