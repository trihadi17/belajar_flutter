import 'package:flutter/material.dart';

//* Import Provider
import 'package:provider/provider.dart';

//* Model
import '../models/product.dart';

//* Folder widget
import 'product_item.dart';

//* Folder Provider
import '../providers/all_products.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* menggunakan provider (menyimpan keseluruhan data)
    //* Products -> class Products di file all_products.dart
    final productData = Provider.of<Products>(context);

    //* Parsing data ke variabel baru
    //* allproducts -> nama getter
    final all_product = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      //* -> widget product_item
      itemBuilder: (ctx, i) => ProductItem(
        all_product[i].id!,
        all_product[i].title!,
        all_product[i].imageUrl!,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
