import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    final allproduct = productData.allproducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allproduct.length,
      itemBuilder: (ctx, i) =>

          //* Cara 1 (efisien) -> Jika bentuknya dalam bentuk class (keseluruhan)
          /* ChangeNotifierProvider(
        create: (context) {
          //* Kenapa allproduct[i] karena dia yang diubah nanti nya satu persatu element list data (per item) */
          return allproduct[i];
        }, */

          //*  Cara 2 (Paling efisien) -> Jika bentuknya value bukan class (per item/per value)
          ChangeNotifierProvider.value(
        value: allproduct[i],
        child: ProductItem(
            /* allproduct[i].id!,
            allproduct[i].title!,
            allproduct[i].imageUrl!, */
            ),
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
