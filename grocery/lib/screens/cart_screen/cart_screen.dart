import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/screens/cart_screen/widgets/single_cart_item.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty? Center(
        child: Text('Empty cart'),
      ) : ListView.builder(
          itemCount: appProvider.getCartProductList.length,
          padding: EdgeInsets.all(12),
          itemBuilder: ((context, index) {
            return SinglecartItem(singleProduct: appProvider.getCartProductList[index],);
          })),
    );
  }
}
