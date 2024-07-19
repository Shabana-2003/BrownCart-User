import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
import 'package:browncart_user/view/products/widgets/productgrid.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomHomeAppBar(
        backgroundColor: Color.fromARGB(121, 202, 200, 198),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "RESULTS",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color:kBlack,
                    fontFamily: "Gruppo-Regular"),
              ),
            ),
           const ProductGrid()
          ],
        ),
      ),
    );
  }
}
