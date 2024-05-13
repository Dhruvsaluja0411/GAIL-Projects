import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/models/product_model/product_model.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/app_provider.dart';

class SinglecartItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SinglecartItem({super.key, required this.singleProduct});

  @override
  State<SinglecartItem> createState() => _SinglecartItemState();
}

class _SinglecartItemState extends State<SinglecartItem> {
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    qty = widget.singleProduct.qty ?? 1;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          12,
        ),
        border: Border.all(color: Colors.red, width: 3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
                height: 140,
                color: Color.fromARGB(255, 244, 54, 54).withOpacity(0.2),
                child: Image.network(widget.singleProduct.image)),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 140,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.singleProduct.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
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
                                    maxRadius: 13,
                                    child: Icon(Icons.remove),
                                  ),
                                ),
                                Text(
                                  qty.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    setState(() {
                                      qty++;
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  child: const CircleAvatar(
                                    maxRadius: 13,
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ],
                            ),
                            CupertinoButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                if (!appProvider.getFavouriteProductList
                                          .contains(widget.singleProduct)) {
                          appProvider.addFavouriteProduct(widget.singleProduct);
                          showMessage("item added to favourites.");
                        }
                        else
                        {
                          appProvider.removeFavouriteProduct(widget.singleProduct);
                          showMessage("item removed from favourites.");
                        }
                              },
                              child: Text(
                                  appProvider.getFavouriteProductList
                                          .contains(widget.singleProduct)
                                      ? "Remove from wishlist"
                                      : "add to wishlist",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Text("₹ ${widget.singleProduct.price.toString()}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        appProvider.removeCartProduct(widget.singleProduct);
                        showMessage("Item removed from cart.");
                      },
                      child: CircleAvatar(
                        maxRadius: 13,
                        child: Icon(
                          Icons.delete,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // color: const Color.fromARGB(255, 244, 240, 240).withOpacity(0.5),
            ),
          )
          // Image.network("https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/36a30296-48ab-4d5a-b8fd-16ee9aeb3427/dfxypy6-0224baaf-5c50-4cad-ab57-7475e2274a94.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM2YTMwMjk2LTQ4YWItNGQ1YS1iOGZkLTE2ZWU5YWViMzQyN1wvZGZ4eXB5Ni0wMjI0YmFhZi01YzUwLTRjYWQtYWI1Ny03NDc1ZTIyNzRhOTQucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.T9CzT0fJudJYmV_cO6GELqQGUKXJb3o77xmnr6Alt_8")
        ],
      ),
    );
  }
}
