//////
import 'package:browncart_user/model/category_model.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/search_all_products.dart';
import 'package:browncart_user/view/home/widgets/custom_bottom_product_info.dart';
import 'package:browncart_user/view/home/widgets/custom_brand.dart';
import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
import 'package:browncart_user/view/home/widgets/home_grid_widget.dart';
import 'package:browncart_user/view/products/products_screen.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import 'widgets/category_widget.dart';

class HomeScreenn extends StatelessWidget {
  const HomeScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHomeAppBar(
          backgroundColor: Color.fromARGB(121, 202, 200, 198)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight10,
                GestureDetector(
                  onTap: (() async {
                    List<Product> allProductsList =
                        await Product.getProducts().first;
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SearchScreen(
                        allProductsList: allProductsList,
                      ),
                      withNavBar: false,
                    );
                  }),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.2),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),
                    child: Row(
                      children: [
                        kWidth10,
                        const Icon(
                          Icons.search,
                        ),
                        kWidth10,
                      const  CommonText(size: 16, title:'Search for products' )
                      ],
                    ),
                  ),
                ),
                kHeight10,
               
                StreamBuilder<List<Category>>(
                  stream: Category.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: CommonText(
                          size: 19,
                          title: 'Somthing went Wrong',
                         
                        ),
                      );
                    } else if (snapshot.hasData) {
                      //List<Category> category = [];
                      final categories = snapshot.data!;
                      if (categories.isEmpty) {
                        return const Center(
                          child: Text('Empty'),
                        );
                      } else {
                        return SizedBox(
                          width: double.infinity,
                          height: 60,
                          child: ListView.builder(
                            physics:const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryWidget(
                                title: categories[index].category,
                              );
                            },
                          ),
                        );
                      }
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ),
                    );
                  },
                  child: Image.asset("img/banner_one.jpeg"),
                ),
                kHeight10,
                const SizedBox(height: 26),
            const Text(
              "NEW ARRIVAL",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"),
            ),
            const SizedBox(height: 10),
            Container(
              width: 190,
              height: 1,
              color: Colors.black,
            ),

            const SizedBox(height: 20),
                const HomeGridView(),
                const SizedBox(height: 35),
            Container(
              width: 190,
              height: 1,
              color: Colors.black,
            ),
            const CustomBrand(),
            Container(
              width: 190,
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(height: 35),
            const Text(
              "COLLECTIONS",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"),
            ),
            // CustomButton(
            //   label: "Sign Out",
            //   onPressed: () async {
            //     await auth.signout();
            //   },
            // ),
            const SizedBox(height: 20),
            Image.asset("img/banner_two.jpeg"),
            const SizedBox(height: 26),
            const Text(
              "JUST FOR YOU",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"),
            ),
            const SizedBox(height: 20),
             const Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomBottomProductInfo(
                      imagePath: 'img/product1.jpeg',
                      title:
                          'CANDYJEANS Womens Sleeveless Cropped T-Shirt Top, Round Neck',
                      price: '₹ 900',
                    ),
                    SizedBox(width: 20),
                    CustomBottomProductInfo(
                      imagePath: 'img/product1.jpeg',
                      title:
                          'CANDYJEANS Womens Sleeveless Cropped T-Shirt Top, Round Neck',
                      price: '₹ 900',
                    ),
                    SizedBox(width: 20),
                    CustomBottomProductInfo(
                      imagePath: 'img/product1.jpeg',
                      title:
                          'CANDYJEANS Womens Sleeveless Cropped T-Shirt Top, Round Neck',
                      price: '₹ 900',
                    ),
                    SizedBox(width: 20),
                    CustomBottomProductInfo(
                      imagePath: 'img/product1.jpeg',
                      title:
                          'CANDYJEANS Womens Sleeveless Cropped T-Shirt Top, Round Neck',
                      price: '₹ 900',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              width: 190,
              height: 1,
              color: Colors.black,
              
            ),
            const SizedBox(height: 9),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
