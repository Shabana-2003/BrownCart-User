import 'package:browncart_user/main.dart';
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/selected_item_elevated_button.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../view/utils/constants/size/sized_box.dart';

// class SelectedItemScreen extends StatefulWidget {
//   const SelectedItemScreen({
//     super.key,
//     required this.product,
//   });

//   final Product product;

//   @override
//   State<SelectedItemScreen> createState() => _SelectedItemScreenState();
// }

// class _SelectedItemScreenState extends State<SelectedItemScreen> {
//   bool isClicked = true;
//   int activeIndex = 0;
//   int quantity = 1;

//   getQuantity(int newQuantity) {
//     setState(() {
//       quantity = newQuantity;
//     });
//   }

//   final user = FirebaseAuth.instance.currentUser!.email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: SafeArea(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 425,
//                   child: Column(
//                     children: [
//                       CarouselSlider.builder(
//                         itemCount: widget.product.images.length,
//                         itemBuilder: ((context, index, realIndex) {
//                           final String assetImage =
//                               widget.product.images[index];
//                           return buildImage(assetImage, index);
//                         }),
//                         options: CarouselOptions(
//                             height: 400,
//                             viewportFraction: 1,
//                             onPageChanged: ((index, reason) {
//                               setState(() {
//                                 activeIndex = index;
//                               });
//                             })),
//                       ),
//                       kHeight10,
//                       buildIndicator(), //.
//                     ],
//                   ),
//                 ),
//                 kHeight10,
//                 CommonText(
//                   size: 17,
//                   title: widget.product.productName,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 kHeight10,
//                 Align(
//                     alignment: Alignment.topLeft,
//                     child: CommonText(
//                       size: 17,
//                       title: '₹ ${widget.product.price}',
//                       color: kBrown,
//                       fontWeight: FontWeight.bold,
//                     )),
//                 kHeight10,
//                 Text(
//                   'Size: ${widget.product.size}',
//                 ),
//                 kHeight10,
//                 Row(
//                   children: <Widget>[
//                     const Icon(
//                       Icons.fire_truck,
//                     ),
//                     kWidth10,
//                     const CommonText(size: 15, title: "Free Delivery")
//                   ],
//                 ),
//                 kHeight10,
//                 Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                       border: Border.all(width: 0.5, color: kBlack38),
//                       borderRadius: BorderRadius.circular(5),
//                       color: const Color.fromARGB(255, 82, 46, 33)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       CommonText(
//                         size: 25,
//                         title: '₹ ${widget.product.price}',
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//                 kHeight10,
//                 const Divider(
//                   thickness: 2,
//                 ),
//                 kHeight10,
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     const CommonText(size: 19, title: "Highlights"),
//                     kHeight10,
//                     CommonText(
//                       size: 15,
//                       title: widget.product.description,
//                       fontWeight: FontWeight.w400,
//                     )
//                   ],
//                 ),
//                 kHeight10,
//                 const Divider(
//                   thickness: 2,
//                 ),
//                 kHeight10,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     isClicked
//                         ? SelectedItemElevatedButtonWidget(
//                             text: 'Add to Cart',
//                             onPressed: () async {
//                               setState(() {
//                                 isClicked = false;
//                               });
//                               showDialog(
//                                 context: context,
//                                 builder: ((context) {
//                                   return Center(
//                                     child: CircularProgressIndicator(
//                                       color: kBrown,
//                                     ),
//                                   );
//                                 }),
//                               );
//                               await Cart.addToCart(
//                                 user: user!,
//                                 productName: widget.product.productName,
//                                 image: widget.product.images[0],
//                                 price: widget.product.price,
//                                 itemCount: quantity,
//                               );
//                               showSnackBar(
//                                 // ignore: use_build_context_synchronously
//                                 context,
//                                 'Product added to Cart successfully',
//                                 kBrown,
//                               );
//                               navigatorKey.currentState!
//                                   .popUntil((route) => route.isFirst);
//                             },
//                             backColor: Colors.white,
//                           )
//                         : SelectedItemElevatedButtonWidget(
//                             text: 'Go to cart',
//                             onPressed: () async {
//                               setState(() {
//                                 isClicked = true;
//                               });
//                             },
//                             backColor: Colors.white,
//                           ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildImage(String assetImage, int index) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 12),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: NetworkImage(assetImage),
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }

//   Widget buildIndicator() {
//     return AnimatedSmoothIndicator(
//       activeIndex: activeIndex,
//       count: widget.product.images.length,
//       effect: const JumpingDotEffect(
//         activeDotColor: Colors.brown,
//         dotHeight: 10,
//         dotWidth: 15,
//       ),
//     );
//   }
// }

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
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 425,
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
                            height: 400,
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
                kHeight10,
                CommonText(
                  size: 17,
                  title: widget.product.productName,
                  fontWeight: FontWeight.bold,
                ),
                kHeight10,
                Align(
                    alignment: Alignment.topLeft,
                    child: CommonText(
                      size: 17,
                      title: '₹ ${widget.product.price}',
                      color: kBrown,
                      fontWeight: FontWeight.bold,
                    )),
                kHeight10,
                Text(
                  'Size: ',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                kHeight10,
                Wrap(
                  spacing: 8.0,
                  children: widget.product.size.map((size) {
                    return ChoiceChip(
                      label: Text(
                        size[0].toUpperCase() + size.substring(1),
                        style: TextStyle(
                          color: selectedSize == size ? Colors.white : Colors.black,
                        ),
                      ),
                      selected: selectedSize == size,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedSize = selected ? size : null;
                        });
                      },
                      selectedColor: kBrown,
                    );
                  }).toList(),
                ),
                kHeight10,
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.fire_truck,
                    ),
                    kWidth10,
                    const CommonText(size: 15, title: "Free Delivery")
                  ],
                ),
                kHeight10,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: kBlack38),
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 82, 46, 33)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CommonText(
                        size: 25,
                        title: '₹ ${widget.product.price}',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                kHeight10,
                const Divider(
                  thickness: 2,
                ),
                kHeight10,
                Column(
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
                kHeight10,
                const Divider(
                  thickness: 2,
                ),
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    isClicked
                        ? SelectedItemElevatedButtonWidget(
                            text: 'Add to Cart',
                            onPressed: () async {
                              if (selectedSize == null) {
                                showSnackBar(
                                  context,
                                  'Please select a size',
                                  Colors.red,
                                );
                                return;
                              }
                              setState(() {
                                isClicked = false;
                              });
                              showDialog(
                                context: context,
                                builder: ((context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: kBrown,
                                    ),
                                  );
                                }),
                              );
                              await Cart.addToCart(
                                user: user!,
                                productName: widget.product.productName,
                                image: widget.product.images[0],
                                price: widget.product.price,
                                itemCount: quantity,
                                selectedSize: selectedSize!, // Add selected size to the cart
                              );
                              showSnackBar(
                                context,
                                'Product added to Cart successfully',
                                kBrown,
                              );
                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            },
                            backColor: Colors.white,
                          )
                        : SelectedItemElevatedButtonWidget(
                            text: 'Go to cart',
                            onPressed: () async {
                              setState(() {
                                isClicked = true;
                              });
                            },
                            backColor: Colors.white,
                          ),
                  ],
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
        dotHeight: 10,
        dotWidth: 15,
      ),
    );
  }
}
