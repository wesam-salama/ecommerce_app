import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/providers/firestore_provider.dart';
import 'package:e_commerce/ui/widgets/CategoriesStory.dart';
import 'package:e_commerce/ui/widgets/bottomNavigationBar.dart';
import 'package:e_commerce/ui/widgets/categoriesCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAndCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF5F6F8),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  right: 16, left: 32, top: 16, bottom: 25),
              child: Text(
                "Categories",
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  CategoriesStory(
                    imageUrl: 'lib/assets/clothes.png',
                    imageText: "Apparel",
                    firstColor: Color(0xFFFFAE4E),
                    secondColor: Color(0xFFFF7676),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/beauty.png',
                    imageText: "Beauty",
                    firstColor: Color(0xFF4EFFF8),
                    secondColor: Color(0xFF76BAFF),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/shoes.png',
                    imageText: "Shoes",
                    firstColor: Color(0xFFB4FF4E),
                    secondColor: Color(0xFF2FC145),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/electronics.png',
                    imageText: "Electronics",
                    firstColor: Color(0xFFD5A3FF),
                    secondColor: Color(0xFF77A5F8),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/furniture.png',
                    imageText: "Furniture",
                    firstColor: Color(0xFFFFF84E),
                    secondColor: Color(0xFFE6B15C),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/home.png',
                    imageText: "Home",
                    firstColor: Color(0xFFFF74A4),
                    secondColor: Color(0xFF9F6EA3),
                  ),
                  CategoriesStory(
                    imageUrl: 'lib/assets/stationary.png',
                    imageText: "Stationary",
                    firstColor: Color(0xFF9D9E9F),
                    secondColor: Color(0xFF505862),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  right: 25, left: 25, top: 25, bottom: 25),
              child: Text(
                "Latest",
                style: TextStyle(
                  fontFamily: "Neusa Next Std",
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Color(0xff515c6f),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 275,
                padding: EdgeInsets.all(8),
                color: Colors.transparent,

                child: FutureBuilder<List<Product>>(
                  future: Provider.of<FirestoeProvider>(context).getProduct(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Product>> snapshot) {
                    if (snapshot.hasData) {
                      List<Product> pr = snapshot.data;

                      if (pr.length > 0) {
                        return GridView.builder(
                          itemCount: pr.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.9,
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return CategoriesCart(pr[index]);
                          },
                        );
                      } else {
                        return Center(
                          child: Text('No product'),
                        );
                      }
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),

                // child: GridView.count(
                //   childAspectRatio: 0.9,
                //   crossAxisCount: 2,
                //   crossAxisSpacing: 8,
                //   mainAxisSpacing: 8,
                //   children: <Widget>[
                //     CategoriesCart(),
                //     CategoriesCart(),
                //     CategoriesCart(),
                //     CategoriesCart(),
                //   ],
                // ),
              ),
            ),
            BottomNavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
