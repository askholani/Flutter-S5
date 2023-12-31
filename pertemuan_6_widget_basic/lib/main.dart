import 'package:flutter/material.dart';
// import 'package:pertemuan_6/basic_widgets/image_widget.dart';
import 'package:pertemuan_6/basic_widgets/text_widget.dart';

// main () : fungsi yang dijalankan pertama kali saat apk di jalankan
// runApp(const MyApp()) : mengeksekusi kode MyApp
void main() {
  runApp(const MyApp());
}

// StatelessWidget : widget yang tidak perlu berubah setelah dibuat.
// Widget : bangunan dasar untuk membangun antarmuka pengguna
// widget : objek digunakan dan diatur dalam tata letak
// MaterialApp : kelas untuk struktur utama dari aplikasi Flutter (material design)
// home : Widget yang akan ditampilkan saat aplikasi pertama kali dijalankan.
// const MyApp({super.key});: Ini adalah konstruktor kelas MyApp.
class MyApp extends StatelessWidget {
  // const MyApp : pemanggilan konstruktor kelas MyApp (membuat objek MyApp).
  // {} : paramater opsional => dapat memanggil konstruktor MyApp dengan menyebutkan nama parameter saat membuat objek, seperti MyApp(key: someKey).
  // super.key : meneruskan parameter key ke konstruktor kelas induk (StatelessWidget)
  const MyApp({super.key});

  // metode di bawahnya akan menggantikan metode dari kelas induk
  @override

  // build : merender tampilan widget
  // BuildContext context. BuildContext : (objek )memberikan informasi tentang pohon widget saat ini, seperti tema aplikasi, bahasa, dan banyak informasi lainnya.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// ---------------

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  // membuat objek state yang terkait dengan widget MyHomePage.
  // State<MyHomePage>: tipe objek
  // setiap widget yang dapat berubah terkait dengan objek State
  // createState(): metode yang digunakan untuk membuat objek State.
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

//   @override
  Widget build(BuildContext context) {
    // Scaffold === container (tailwind)
    // kerangka dasar
    //Scaffold biasanya digunakan bagian terluar dari struktur widget dalam suatu aplikasi dan menangani banyak fitur dan tata letak umum
    return Scaffold(
      // AppBar biasanya berisi judul, ikon aksi, dan tombol navigasi.
      // ditampilkan di bagian atas suatu "scaffold"
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body properti pada widget Scaffold.
      // menetapkan isi utama dari tata letak halaman atau layar aplikasi.
      // Isinya dapat berupa widget atau struktur tata letak yang kompleks, seperti Column, ListView, atau Container.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // const Text(
            //   'You have pushed the button this many times:',
            const MyTextWidget(),
            // const MyImageWidget(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     title: 'Flutter Demo',
//   //     theme: ThemeData(
//   //       primarySwatch: Colors.red,
//   //     ),
//   //     home: const MyHomePage(title: 'My Increment App'),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text("Contoh TextField")),
//         body: const TextField(
//           obscureText: false,
//           decoration: InputDecoration(
//             border: OutlineInputBorder(),
//             labelText: 'Nama',
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         child: Container(
//           height: 50.0,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment Counter',
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';

// // main : mnejalankan apk Flutter
// // memanggil konstruktor MyApp()
// void main() => runApp(const MyApp());

// // Myapp : widget aplikasi utama
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Contoh Date Picker',
//       home: MyHomePage(title: 'Contoh Date Picker'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // Variable/State untuk mengambil tanggal
//   DateTime selectedDate = DateTime.now();

//   //  Initial SelectDate FLutter
//   Future<void> _selectDate(BuildContext context) async {
//     // Initial DateTime FIinal Picked
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Text("${selectedDate.toLocal()}".split(' ')[0]),
//             const SizedBox(
//               height: 20.0,
//             ),
//             ElevatedButton(
//               onPressed: () => {
//                 _selectDate(context),
//                 // ignore: avoid_print
//                 print(selectedDate.day + selectedDate.month + selectedDate.year)
//               },
//               child: const Text('Pilih Tanggal'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
