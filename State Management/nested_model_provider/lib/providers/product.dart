import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

//* NESTED MODEL dengan ChangeNotifier (provider)
//* Product adalah model
//* ChangeNotifier adalah provider
class Product with ChangeNotifier {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void statusFav() {
    isFavorite = !isFavorite;

    //* notifyListeners() -> harus ada jika ada perubahan data gunanya supaya memberi tahu ada perubahan data
    notifyListeners();
  }
}
