import 'package:browncart_user/view/product_details/product_details.dart';
import 'package:flutter/material.dart';

class CustomProductInfo extends StatelessWidget {
  const CustomProductInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductDetails()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/product1.jpeg', width: 200, height: 200),
                      const Padding(
                        padding: EdgeInsets.only(left: 9, right: 9),
                        child: Text(
                          'Womens Top Sleeveless T-Shir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      const Text(
                        '₹ 900',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 127, 67, 34),
                            fontFamily: "Gruppo-Regular"),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductDetails()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/product1.jpeg', width: 200, height: 200),
                      const Padding(
                        padding: EdgeInsets.only(left: 9, right: 9),
                        child: Text(
                          'Womens Top Sleeveless T-Shir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      const Text(
                        '₹ 900',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 127, 67, 34),
                            fontFamily: "Gruppo-Regular"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductDetails()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/product1.jpeg', width: 200, height: 200),
                      const Padding(
                        padding: EdgeInsets.only(left: 9, right: 9),
                        child: Text(
                          'Womens Top Sleeveless T-Shir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      const Text(
                        '₹ 900',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 127, 67, 34),
                            fontFamily: "Gruppo-Regular"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductDetails()),
                    );
                  },
                  child: Column(
                    children: [
                      Image.asset('img/product1.jpeg', width: 200, height: 200),
                      const Padding(
                        padding: EdgeInsets.only(left: 9, right: 9),
                        child: Text(
                          'Womens Top Sleeveless T-Shir',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontFamily: "Gruppo-Regular"),
                        ),
                      ),
                      const Text(
                        '₹ 900',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 127, 67, 34),
                            fontFamily: "Gruppo-Regular"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
