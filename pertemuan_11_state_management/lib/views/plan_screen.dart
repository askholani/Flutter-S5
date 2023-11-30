import '../models/data_layer.dart';
import 'package:flutter/material.dart';

// dalam 1 class bisa terdapat banyak @override
// @override : memberi tanda bahwa suatu metode dalam class harus menggantikan metode dari superclass atau interface

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});
  @override
  // Metode untuk membuat instance dari _PlanScreenState.
  // _PlanScreenState : State dari PlanScreen
  State createState() => _PlanScreenState();
}

// meng-extend State<PlanScreen> : menciptakan hubungan parent-child antara widget PlanScreen dan state _PlanScreenState.
// State<T> : class tersebut menjadi state yang dikaitkan dengan widget T.
// StatefulWidget : widget yang memiliki state yang dapat berubah.
// State : objek yang menyimpan informasi state dan digunakan untuk merender tampilan widget.
class _PlanScreenState extends State<PlanScreen> {
  Plan plan = const Plan();

  // late menandakan bahwa variabel ini akan diinisialisasi nanti, yaitu setelah widget ini dibangun.
  // ScrollController akan digunakan untuk mengontrol scroll pada ListView yang berisi daftar tugas.
  // ScrollController, merespons peristiwa scroll dan melakukan tindakan tertentu, seperti menghapus fokus dari semua TextField saat terjadi peristiwa scroll, sehingga pengguna dapat dengan mudah mengakses dan mengisi bagian paling bawah dari daftar tugas.
  // meningkatkan pengalaman pengguna pada perangkat iOS dengan memastikan bahwa saat keyboard tampil, pengguna masih dapat dengan mudah mengakses dan mengisi TextField yang berada di bagian bawah layar.
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    // Initialize the ScrollController
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  // BuildContext :  objek yang memberikan informasi posisi widget dalam pohon widget.
  // BuildContext juga menyediakan akses ke berbagai fitur.
  // variabel context : parameter yang merepresentasikan BuildContext pada titik di mana widget ini diminta untuk dibangun.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Master Plan Ibnu')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  // membuat dan mengembalikan widget Floating Action Button yang berisi ikon "tambah"
  Widget _buildAddTaskButton() {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            plan = Plan(
              name: plan.name,
              // menciptakan salinan list tugas saat ini dan menambahkan tugas baru ke dalamnya.
              tasks: List<Task>.from(plan.tasks)..add(const Task()),
            );
          });
        });
  }

  //  membuat dan mengembalikan widget ListView yang akan menampilkan daftar tugas.
  // Jumlah item dalam ListView sesuai dengan panjang list plan.tasks.
  Widget _buildList() {
    return ListView.builder(
        controller: scrollController,
        keyboardDismissBehavior:
            Theme.of(context).platform == TargetPlatform.iOS
                ? ScrollViewKeyboardDismissBehavior.onDrag
                : ScrollViewKeyboardDismissBehavior.manual,
        itemCount: plan.tasks.length,
        // context: Merupakan BuildContext.
        // index: Menunjukkan indeks.
        itemBuilder: (context, index) =>
            _buildTaskTitle(plan.tasks[index], index));
  }

  Widget _buildTaskTitle(Task task, int index) {
    // ListTile : widget untuk menampilkan informasi dalam bentuk baris atau item dalam daftar.
    // Dalam kasus ini, setiap ListTile mewakili satu tugas.
    return ListTile(
      // Leading widget : elemen yang ditempatkan di sebelah kiri atau di bagian awal dari suatu kontainer atau baris.
      //  konteks ListTile, leading widget : elemen yang ditempatkan di sisi kiri dari baris atau item.
      // Checkbox: Digunakan sebagai leading widget di dalam ListTile.
      // Ini adalah kotak centang yang memungkinkan pengguna menandai atau tidak menandai tugas sebagai selesai.
      leading: Checkbox(
          value: task.complete,
          onChanged: (seleted) {
            setState(() {
              plan = Plan(
                  name: plan.name,
                  // List<Task>.from(plan.tasks) Membuat salinan list tasks dari objek plan.
                  // Penggunaan List<Task>.from() menghasilkan salinan list yang baru, sehingga tidak memodifikasi list tasks yang ada secara langsung.
                  // ..[index] = Task(...):
                  // .. : cascade operator atau cascade notation, memungkinkan kita melakukan beberapa operasi pada objek yang sama tanpa harus menyatakan objek tersebut berulang kali.
                  // mengakses elemen pada indeks dari parameter index dari list yang baru dibuat (List<Task>.from(plan.tasks)) dan menggantinya dengan objek Task yang baru.
                  tasks: List<Task>.from(plan.tasks)
                    ..[index] = Task(
                        description: task.description,
                        complete: seleted ?? false));
            });
          }),
      // TextFormField : widget Flutter untuk mengumpulkan input teks dari pengguna.
      // initialValue: task.description:, menetapkan nilai awal dari TextFormField.
      // onChanged: (text) { ... }: dijalankan setiap kali nilai dalam TextFormField berubah.
      // parameter text, yang mewakili nilai saat ini dalam TextFormField.
      title: TextFormField(
        initialValue: task.description,
        onChanged: (text) {
          setState(() {
            plan = Plan(
                name: plan.name,
                tasks: List<Task>.from(plan.tasks)
                  ..[index] = Task(description: text, complete: task.complete));
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    // dispose() : ketika widget sudah tidak digunakan lagi.
    scrollController.dispose();
    super.dispose();
  }
}
