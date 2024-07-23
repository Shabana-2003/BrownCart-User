import 'package:browncart_user/main.dart';
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/home_grid_widget.dart';
import 'package:browncart_user/view/home/widgets/selected_item_appbar.dart';
import 'package:browncart_user/view/home/widgets/selected_item_elevated_button.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SelectedItemScreen extends StatefulWidget {
  const SelectedItemScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<SelectedItemScreen> createState() => _SelectedItemScreenState();
}

class _SelectedItemScreenState extends State<SelectedItemScreen> {
  bool isClicked = true;
  int activeIndex = 0;
  int quantity = 1;
  String? selectedSize;

  getQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectedItemAppBar(
        backgroundColor: kGrey300,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 475,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        itemCount: widget.product.images.length,
                        itemBuilder: ((context, index, realIndex) {
                          final String assetImage =
                              widget.product.images[index];
                          return buildImage(assetImage, index);
                        }),
                        options: CarouselOptions(
                            height: 450,
                            viewportFraction: 1,
                            onPageChanged: ((index, reason) {
                              setState(() {
                                activeIndex = index;
                              });
                            })),
                      ),
                      kHeight10,
                      buildIndicator(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12,top: 12,right: 12),
                  child: CommonText(
                    size: 16,
                    title: widget.product.productName,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: CommonText(
                            size: 17,
                            title: '₹ ${widget.product.price}',
                            color: Color.fromARGB(255, 133, 80, 23),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        kHeight20,
                        Row(
                          children: [
                            const CommonText(
                              size: 17,
                              title: 'size',
                              fontWeight: FontWeight.w200,
                            ),
                            kWidth20,
                
                Wrap(
  spacing: 9.0,
  children: widget.product.size.map((size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = selectedSize == size ? null : size;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedSize == size ? kBlack : Colors.transparent,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: kBlack,
            width: 1.0,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.5),
        child: Text(
          size[0].toUpperCase() + size.substring(1),
          style: TextStyle(
            fontSize: 10.0,
            color: selectedSize == size ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }).toList(),
),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
             
               
                kHeight20,kHeight10
               
                ,Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Expanded(
      child: isClicked
          ? SelectedItemElevatedButtonWidget(
              backColor: kBlack,
              text: 'Add to basket',
              onPressed: () async {
                if (selectedSize == null) {
                  showSnackBar(
                    context,
                    'Please select a size',
                    kBrown,
                  );
                  return;
                }
                setState(() {
                  isClicked = false;
                });
                
                await Cart.addToCart(
                  user: user!,
                  productName: widget.product.productName,
                  image: widget.product.images[0],
                  price: widget.product.price,
                  itemCount: quantity,
                  selectedSize: selectedSize!, // Add selected size to the cart
                );
                showSnackBar(
                  // ignore: use_build_context_synchronously
                  context,
                  'Product added to Cart successfully',
                  kBrown,
                );
                navigatorKey.currentState!.popUntil((route) => route.isFirst);
              },
            )
          : SelectedItemElevatedButtonWidget(
              text: 'Go to cart',
              onPressed: () async {
                setState(() {
                  isClicked = true;
                });
              },
              backColor: kBlack,
            ),
    ),
  ],
),kHeight30,
 Row(
                  children: <Widget>[
                    kWidth10,
                    const Icon(
                      Icons.fire_truck,
                    ),
                    kWidth10,
                    const CommonText(size: 15, title: "Free Delivery Available")
                  ],
                ),
                kHeight10,
                kHeight10,
                const Divider(
                  thickness: 2,
                ),
                kHeight10,
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const CommonText(size: 19, title: "Highlights"),
                      kHeight10,
                      CommonText(
                        size: 15,
                        title: widget.product.description,
                        fontWeight: FontWeight.w400,
                      )
                    ],
                  ),
                ),
                kHeight20,
                const Divider(
                  thickness: 2,
                ),
                kHeight10,
               const Text(
              "YOU MAY ALSO LIKE",
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage(String assetImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(assetImage),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: widget.product.images.length,
      effect: const JumpingDotEffect(
        activeDotColor: Colors.brown,
        dotHeight: 1,
        dotWidth: 16,
      ),
    );
  }
}
