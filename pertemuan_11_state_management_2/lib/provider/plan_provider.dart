import 'package:flutter/material.dart';
import '../models/data_layer.dart';

// InheritedNotifier : sistem pewarisan widget di Flutter
//  memungkinkan widget turunannya dapat mendengarkan perubahan pada notifier
// merender ulang diri mereka sendiri ketika notifikasi tersebut terjadi.
//  <ValueNotifier> pada kelas tersebut : menentukan tipe data yang akan digunakan sebagai notifier dalam InheritedNotifier.
// ValueNotifier<Plan> menunjukkan ValueNotifier digunakan untuk mengelola dan memberi tahu perubahan pada objek Plan.
// ValueNotifier: Ini adalah kelas dalam Flutter, mengelola nilai yang dapat berubah dan memberi tahu listener saat nilai berubah.
class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  // Widget child: Parameter ini adalah widget yang akan menjadi anak dari PlanProvider.
  const PlanProvider(
      {super.key, required Widget child, required ValueNotifier<Plan> notifier})
      : super(child: child, notifier: notifier);

  // context.dependOnInheritedWidgetOfExactType<PlanProvider>()!: mendapatkan widget PlanProvider dari pohon widget yang memiliki tipe yang sama dengan PlanProvider.
  // Metode ini akan mencari widget terdekat yang sesuai tipe dan me-return widget tersebut.
  static ValueNotifier<Plan> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
