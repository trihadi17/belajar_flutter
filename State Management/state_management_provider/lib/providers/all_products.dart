import 'dart:math';

//* Package Change Notifier
import 'package:flutter/material.dart';

//* import model product
import '../models/product.dart';

class Products with ChangeNotifier {
  //* Menyimpan data
  //List<Product> _allproducts = [];
  List<Product> _allproducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  //* Getter data (all)
  List<Product> get allproducts {
    //* menyimpan
    return [..._allproducts];
  }

  //* Get data berdasarkan id
  Product findById(productId) {
    return _allproducts.firstWhere((prodId) => prodId.id == productId);
  }

  //* Menambahkan data
  /*  void addProduct(){
    _allproducts.add(value);
    notifyListeners(); // -> wajib ada jika melakukan perubahan data apapun
  } */
}
