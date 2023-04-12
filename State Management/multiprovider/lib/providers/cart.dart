import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  //* Membuat Map
  //* String adalah tipe data keynya yaitu productId pada product
  //* CartItem adalah modelnya
  Map<String, CartItem> _items = {};

  //* Getter
  Map<String, CartItem> get items => _items;

  //* menghitung jumlah cart
  int get jumlah {
    return _items.length;
  }

  //* Menghitung total price
  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.qty * value.price;
    });

    return total;
  }

  //* Add to char
  void addCart(String productId, String title, double price) {
    //* Jika cart sudah ada pada Map _items menggunakan containsKey
    //* key adalah productId dari product yang dimana nanti masuk ke Map, sebagai Key nya dari sebuah map,
    //* CartItem merupakan model yang di isi dengan data pada model tersebut
    if (_items.containsKey(productId)) {
      // ketika sudah tersedia key product Id
      // menggunakan update pada nama map

      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + 1));
    } else {
      //nambah product id baru
      // menggunakan putIfAbsent pada map
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }

    notifyListeners();
  }
}
