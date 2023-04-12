import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Consumer() adalah alternative dalam penggunaan provider yang dia itu listen: true (selalu true)

    //* Provider untuk element atau widget yang dimana data nya tidak berubah ubah (listen : false)
    final productData = Provider.of<Product>(context);
    //*

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading:
              //* Menggunakan consumer karena hanya element ini saja yang selalu listen : true (berubah ubah datanya)
              //* Consumer() adalah widget
              //* <Product> nested model + provider
              Consumer<Product>(
                  builder: (context, productData, child) => IconButton(
                        icon: (productData.isFavorite)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_border_outlined),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          productData.statusFav();
                        },
                      )),
          title: Text(
            productData.title!,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
