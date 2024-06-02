import 'package:browncart_user/view/home/widgets/custom_bottom_product_info.dart';
import 'package:browncart_user/view/home/widgets/custom_brand.dart';
import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
import 'package:browncart_user/view/home/widgets/custom_product_info.dart';
import 'package:browncart_user/view/products/products_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final auth = AuthController();
    return Scaffold(
      appBar: const CustomHomeAppBar(
          backgroundColor: Color.fromARGB(121, 202, 200, 198)),
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>const ProductScreen(),
          ),
        );
      },
      child: Image.asset("img/banner_one.jpeg"),
    ),
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
            const CustomProductInfo(),
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
    );
  }
}
