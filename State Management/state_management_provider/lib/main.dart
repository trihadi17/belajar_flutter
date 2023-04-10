import 'package:flutter/material.dart';

//* Import Provider
import 'package:provider/provider.dart';

//* FOlder Screen
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

//* Model
import './providers/all_products.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* Provider -> ChangeNotifierProvider (membungkus paling atas agar dibawahnya bisa menggunakannya)
    return ChangeNotifierProvider(
      create: (context) {
        return Products();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          //* Menggunakan primaryswacth dan accent color menggunakan color schame
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'Lato',
        ),

        //* halaman pertama nampil
        home: ProductsOverviewScreen(),

        //* Route
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
