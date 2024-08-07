import 'dart:developer';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/selected_item_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:browncart_user/view/widgets/text_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/size/sized_box.dart';
import '../../../model/cart_model.dart';

class MyCartWidget extends StatefulWidget {
  const MyCartWidget({
    super.key,
    required this.cartItems,
    required this.getQuantity,
    required this.currentQuantity,
  });

  final List<Cart> cartItems;
  final Function(int) getQuantity;
  final int currentQuantity;

  @override
  State<MyCartWidget> createState() => _MyCartWidgetState();
}

class _MyCartWidgetState extends State<MyCartWidget> {
  final Map<int, int> quantities = {};
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.cartItems.length; i++) {
      quantities[i] = widget.currentQuantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 430,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              height: 155,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(width: 0.01),
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                         final product = Product(
                          productName: widget.cartItems[index].productName,
                          images: [widget.cartItems[index].image],
                          description: '',
                          price: widget.cartItems[index].price,
                          size: [widget.cartItems[index].selectedSize], // You can fill in the actual sizes if available
                          category: '', // You can fill in the actual category if available
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectedItemScreen(product: product),
                          ),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: kGrey300,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(width: 0.1),
                          image: DecorationImage(
                            image: NetworkImage(widget.cartItems[index].image),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  kWidth10,
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.cartItems[index].productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: checkOutAddressStyle,
                          ),
                          kHeight10,
                          Text(
                            '₹ ${widget.cartItems[index].price}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Gruppo-Regular",
                              color: Colors.brown,
                            ),
                          ),
                          //kHeight10,
                          Row(
                            children: [
                             const CommonText(size: 14, title: 'Quantity'),
                              kWidth10,
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 241, 241, 241),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: quantities[index]! < 2
                                      ?const Icon(Icons.remove)
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              quantities[index] = quantities[index]! - 1;
                                              widget.getQuantity(quantities[index]!);
                                            });
                                            Cart.updateCart(
                                              cartItem: widget.cartItems[index],
                                              quantity: quantities[index]!,
                                              user: user!,
                                            );
                                            log(quantities[index].toString());
                                          },
                                          child: const Icon(Icons.remove),
                                        ),
                                ),
                              ),
                              kWidth10,
                              Text(
                                quantities[index]!.toString(),
                                style:const TextStyle(fontSize: 20, color: Colors.brown),
                              ),
                              kWidth10,
                              Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color:const Color.fromARGB(255, 241, 241, 241),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        quantities[index] = quantities[index]! + 1;
                                        widget.getQuantity(quantities[index]!);
                                      });
                                      Cart.updateCart(
                                        cartItem: widget.cartItems[index],
                                        quantity: quantities[index]!,
                                        user: user!,
                                      );
                                    },
                                    child: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: ((context) {
                                      return AlertDialog(
                                        backgroundColor: kBrown,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        title: Text(
                                          'Remove from cart',
                                          style:textLoginButtonStyle,
                                        ),
                                        content: Text(
                                          'Do you want to remove the item from cart',
                                          style: textloginStyle,
                                        ),
                                        actions: [
                                          TextButtonWidget(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            text: Text(
                                              'No',
                                              style: textloginStyle,
                                            ),
                                          ),
                                          TextButtonWidget(
                                            onPressed: () {
                                              Cart.deleteCartItem(
                                                user: user!,
                                                cartItem: widget.cartItems[index],
                                              );
                                              Navigator.pop(context);
                                            },
                                            text: Text(
                                              'Yes',
                                              style: textloginStyle,
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                  );
                                },
                                child: CommonText(
                                  size: 15,
                                  title: 'X Remove',
                                  color: kBrown
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: widget.cartItems.length,
        ),
      ),
    );
  }
}
// import 'dart:developer';
// import 'package:browncart_user/model/product_model.dart';
// import 'package:browncart_user/view/home/home_screen.dart';
// import 'package:browncart_user/view/home/selected_item_screen.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:browncart_user/view/utils/constants/style/text_style.dart';
// import 'package:browncart_user/view/widgets/text_button_widget.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../utils/constants/size/sized_box.dart';
// import '../../../model/cart_model.dart';

// class MyCartWidget extends StatefulWidget {
//   const MyCartWidget({
//     super.key,
//     required this.cartItems,
//     required this.getQuantity,
//     required this.currentQuantity,
//   });

//   final List<Cart> cartItems;
//   final Function(int) getQuantity;
//   final int currentQuantity;

//   @override
//   State<MyCartWidget> createState() => _MyCartWidgetState();
// }

// class _MyCartWidgetState extends State<MyCartWidget> {
//   final Map<int, int> quantities = {};
//   final user = FirebaseAuth.instance.currentUser!.email;

//   @override
//   void initState() {
//     super.initState();
//     for (var i = 0; i < widget.cartItems.length; i++) {
//       quantities[i] = widget.currentQuantity;
//     }
//   }

//   void _showDeleteDialog(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: kBrown,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           title: Text(
//             'Remove from cart',
//             style: textLoginButtonStyle,
//           ),
//           content: Text(
//             'Do you want to remove the item from cart?',
//             style: textloginStyle,
//           ),
//           actions: [
//             TextButtonWidget(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               text: Text(
//                 'No',
//                 style: textloginStyle,
//               ),
//             ),
//             TextButtonWidget(
//               onPressed: () {
//                 Cart.deleteCartItem(
//                   user: user!,
//                   cartItem: widget.cartItems[index],
//                 ).then((_) {
//                   setState(() {
//                     widget.cartItems.removeAt(index);
//                   });
//                   if (widget.cartItems.isEmpty) {
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const HomeScreenn()),
//                       (Route<dynamic> route) =>
//                           false, // This will remove all the previous routes
//                     );
//                   }
//                 });
//                 Navigator.pop(context);
//               },
//               text: Text(
//                 'Yes',
//                 style: textloginStyle,
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: SizedBox(
//         height: 430,
//         child: ListView.separated(
//           itemBuilder: (context, index) {
//             return Container(
//               height: 155,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(0),
//                 border: Border.all(width: 0.01),
//               ),
//               child: Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: GestureDetector(
//                       onTap: () {
//                         final product = Product(
//                           productName: widget.cartItems[index].productName,
//                           images: [widget.cartItems[index].image],
//                           description: '',
//                           price: widget.cartItems[index].price,
//                           size: [widget.cartItems[index].selectedSize],
//                           category: '',
//                         );

//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 SelectedItemScreen(product: product),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: 120,
//                         height: double.infinity,
//                         decoration: BoxDecoration(
//                           color: kGrey300,
//                           borderRadius: BorderRadius.circular(0),
//                           border: Border.all(width: 0.1),
//                           image: DecorationImage(
//                             image: NetworkImage(widget.cartItems[index].image),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   kWidth10,
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             widget.cartItems[index].productName,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: checkOutAddressStyle,
//                           ),
//                           kHeight10,
//                           Text(
//                             '₹ ${widget.cartItems[index].price}',
//                             style: const TextStyle(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w600,
//                               fontFamily: "Gruppo-Regular",
//                               color: Colors.brown,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               const CommonText(size: 14, title: 'Quantity'),
//                               kWidth10,
//                               Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 241, 241, 241),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       if (quantities[index]! == 1) {
//                                         _showDeleteDialog(index);
//                                       } else {
//                                         setState(() {
//                                           quantities[index] =
//                                               quantities[index]! - 1;
//                                           widget
//                                               .getQuantity(quantities[index]!);
//                                         });
//                                         Cart.updateCart(
//                                           cartItem: widget.cartItems[index],
//                                           quantity: quantities[index]!,
//                                           user: user!,
//                                         );
//                                         log(quantities[index].toString());
//                                       }
//                                     },
//                                     child: const Icon(Icons.remove),
//                                   ),
//                                 ),
//                               ),
//                               kWidth10,
//                               Text(
//                                 quantities[index]!.toString(),
//                                 style: const TextStyle(
//                                     fontSize: 20, color: Colors.brown),
//                               ),
//                               kWidth10,
//                               Container(
//                                 height: 30,
//                                 width: 30,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                   color:
//                                       const Color.fromARGB(255, 241, 241, 241),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Center(
//                                   child: GestureDetector(
//                                     onTap: () {
//                                       setState(() {
//                                         quantities[index] =
//                                             quantities[index]! + 1;
//                                         widget.getQuantity(quantities[index]!);
//                                       });
//                                       Cart.updateCart(
//                                         cartItem: widget.cartItems[index],
//                                         quantity: quantities[index]!,
//                                         user: user!,
//                                       );
//                                     },
//                                     child: const Icon(Icons.add),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               GestureDetector(
//                                 onTap: () {
//                                   _showDeleteDialog(index);
//                                 },
//                                 child: CommonText(
//                                   size: 15,
//                                   title: 'X Remove',
//                                   color: kBrown,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//           separatorBuilder: (context, index) {
//             return const Divider();
//           },
//           itemCount: widget.cartItems.length,
//         ),
//       ),
//     );
//   }
// }
