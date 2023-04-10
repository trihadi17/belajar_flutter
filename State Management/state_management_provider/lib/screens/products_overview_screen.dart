import 'package:flutter/material.dart';

//* Model
import '../models/product.dart';

//* Folder Widgets
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      //* Widget product_grid
      body: ProductGrid(),
    );
  }
}
