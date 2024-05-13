import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/constants/routes.dart';
import 'package:grocery/models/category_model/category_model.dart';
import 'package:grocery/models/product_model/product_model.dart';
import 'package:grocery/provider/app_provider.dart';
import 'package:grocery/screens/category_view/category_view.dart';
import 'package:grocery/screens/product_details/product_details.dart';
import 'package:grocery/widgets/top_title/top_title.dart';
import 'package:provider/provider.dart';

import '../../firebase_helper/firebase_firestore_helper/firebase_firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    AppProvider appProvider = Provider.of<AppProvider>(context,listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    // FirebaseFirestoreHelper.instance.updateTokenFromFirebase();
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();

    
    productModelList.shuffle();
    // if (mounted) {
    setState(() {
      isLoading = false;
    });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TopTitles(title: "Ecommerce", subtitle: ""),
                          TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.search_outlined),
                              label: Text('search...'),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            'Categories',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 12,),

                    categoriesList.isEmpty
                        ? const Center(
                            child: Text("Categories is empty."),
                          )
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: categoriesList
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: (){
                                          Routes.instance.push(CategoryView(categoryModel: e), context);
                                        },
                                        child: Card(
                                          color: Colors.white,
                                          elevation: 5,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(e.image),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Best Products',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // SizedBox(height: 12,),
                    productModelList.isEmpty
                        ? const Center(
                            child: Text("Best products is empty."),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: GridView.builder(
                              padding: EdgeInsets.only(bottom: 40),
                              shrinkWrap: true,
                              primary: false,
                              itemCount: productModelList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 12,
                                      crossAxisSpacing: 12,
                                      childAspectRatio: 0.7,
                                      crossAxisCount: 2),
                              itemBuilder: ((context, index) {
                                ProductModel singleProduct =
                                    productModelList[index];
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Image.network(
                                        singleProduct.image,
                                        height: 100,
                                        width: 100,
                                      ),
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        singleProduct.name,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Price: ₹ ${singleProduct.price}"),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      SizedBox(
                                          height: 45,
                                          width: 140,
                                          child: OutlinedButton(
                                              onPressed: () {
                                                Routes.instance.push(ProductDetails(singleProduct: singleProduct), context);
                                              },
                                              child: const Text('Buy'))),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(height: 12,),
                  ]),
            ),
    );
  }
}

// List<String> categoriesList = [
//   "https://static.vecteezy.com/system/resources/previews/019/607/567/non_2x/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png",
//   "https://static.vecteezy.com/system/resources/previews/009/345/591/original/stir-fry-salad-with-sushi-and-shrimps-in-a-bowl-with-a-slate-background-top-view-copy-space-shrimp-and-vegetables-served-with-salad-chopsticks-with-asian-food-vector-free-png.png",
//   "https://static.vecteezy.com/system/resources/previews/020/003/852/original/bulgogi-graphic-clipart-design-free-png.png",
//   "https://static.vecteezy.com/system/resources/thumbnails/000/555/006/small/HEALTHY_FOOD_1-01.png",
//   "https://i.pinimg.com/originals/ff/c3/d3/ffc3d3f7e25c28ea2d3fe42231736f00.png",
// ];

// List<ProductModel> bestProducts = [
//   ProductModel(
//       image:
//           "https://w7.pngwing.com/pngs/55/75/png-transparent-graphy-banana-fruit-footage-berry-golden-banana-food-golden-frame-orange.png",
//       id: "1",
//       name: "Banana",
//       price: 10,
//       description: "This is good for health and yellow in color.",
//       status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://e7.pngegg.com/pngimages/14/397/png-clipart-apple-apple.png",
//       id: "2",
//       name: "Apple",
//       price: 20,
//       description: "This is good for health and red in color.",
//       status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://e7.pngegg.com/pngimages/734/792/png-clipart-juice-pineapple-smoothie-fruit-vegetable-cut-pineapple-pineapple-fruit-natural-foods-food.png",
//       id: "3",
//       name: "Pineapple",
//       price: 50,
//       description: "This is very good for health and yellow in color.",
//       status: "pending",
//       isFavourite: false),
//   ProductModel(
//       image:
//           "https://w7.pngwing.com/pngs/790/811/png-transparent-sliced-mangoe-juice-mango-alphonso-fruit-flavor-mango-food-dried-fruit-tropical-fruit-thumbnail.png",
//       id: "4",
//       name: "Mango",
//       price: 25,
//       description: "This is okay for health and yellow in color.",
//       status: "pending",
//       isFavourite: false),
// ];
