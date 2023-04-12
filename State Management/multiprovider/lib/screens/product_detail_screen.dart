import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    //* Provider Produc
    final product = Provider.of<Products>(context).findById(productId);

    //* Provider Cart
    //* -> Listen itu adalah digunakan jika ada perubahan tampilan ketika memasukkan data
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badge(child: ch!, value: value.jumlah.toString());
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${product.title}",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${product.description}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 35),
          OutlinedButton(
              onPressed: () {
                //* Scaffold Messanger (Snackbar)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Berhasil Ditambahkan'),
                  duration: Duration(seconds: 1),
                ));

                //* Add Cart
                cart.addCart(product.id, product.title, product.price);
              },
              child: Text(
                'Add to chart',
                style: TextStyle(fontSize: 24),
              ))
        ],
      ),
    );
  }
}
