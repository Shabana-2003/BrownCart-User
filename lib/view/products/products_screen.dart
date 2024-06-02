import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
import 'package:browncart_user/view/home/widgets/custom_product_info.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppBar(
        backgroundColor: Color.fromARGB(121, 202, 200, 198),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "RESULTS",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Gruppo-Regular"),
              ),
            ),
            CustomProductInfo(),
            CustomProductInfo(),
            CustomProductInfo(),
            CustomProductInfo(),
          ],
        ),
      ),
    );
  }
}
