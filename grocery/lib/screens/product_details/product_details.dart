import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/constants/constants.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/provider/app_provider.dart';
import 'package:grocery/screens/cart_screen/cart_screen.dart';
import 'package:grocery/screens/favourite_screen/favourite_screen.dart';
import 'package:provider/provider.dart';

import '../../models/product_model/product_model.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance.push(CartScreen(), context);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 20,),
              Center(
                child: Image.network(
                  widget.singleProduct.image,
                  height: 400,
                  width: 400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.singleProduct.isFavourite =
                              !widget.singleProduct.isFavourite;
                        });
                        if (widget.singleProduct.isFavourite) {
                          appProvider.addFavouriteProduct(widget.singleProduct);
                          showMessage("item added to favourites.");
                        }
                        else
                        {
                          appProvider.removeFavouriteProduct(widget.singleProduct);
                          showMessage("item removed from favourites.");
                        }
                      },
                      icon: Icon(appProvider.getFavouriteProductList.contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border)),
                ],
              ),
              Text(widget.singleProduct.description),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      if (qty >= 1) {
                        setState(() {
                          qty--;
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              // Spacer(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 38,
                    width: 140,
                    child: OutlinedButton(
                        onPressed: () {
                          ProductModel productModel =
                              widget.singleProduct.copyWith(qty: qty);
                          appProvider.addCartProduct(productModel);
                          showMessage("Item added to cart.");
                        },
                        child: Text("Add to cart"),
                        style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.red,
                            backgroundColor: Colors.white,
                            textStyle: const TextStyle(
                              color: Colors.red,
                            ),
                            side:
                                const BorderSide(color: Colors.red, width: 1.7),
                            disabledForegroundColor:
                                Colors.red.withOpacity(0.38))),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SizedBox(
                      height: 38,
                      width: 150,
                      child:
                          ElevatedButton(onPressed: () {
                            // Routes.instance.push(FavouriteScreen(), context);
                          }, child: Text('Buy')))
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
