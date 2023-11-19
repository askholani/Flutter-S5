class Item {
  String name;
  int price;

  // kode dibawah error akibat dart menerapkan nullability eksplisit
  // perlu di tambahkan notasi required
  // nilai awal
  // Item({this.name, this.price});

  // Item({this.name = '', this.price = 0});

  Item({required this.name, required this.price});
}
