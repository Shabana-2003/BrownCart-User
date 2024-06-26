import 'package:browncart_user/view/checkout/checkout_container.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../model/cart_model.dart';
import 'widgets/my_cart_widget.dart';

class BagScreen extends StatefulWidget {
  BagScreen({
    super.key,
    required this.getQuantity,
  });

  final Function(int) getQuantity;

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const CommonText(size: 22, title:"My Cart"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Cart>>(
        stream: Cart.getCartItems(user!),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final cartItems = snapshot.data;
            if (cartItems!.isEmpty) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   height: 150,
                    //   width: 150,
                    //   child: Lottie.asset(
                    //     'assets/lottie/33740-sad-empty-box.json',
                    //   ),
                    // ),
                    kHeight10,
                  
                    CommonText(size: 16, title:'Your cart is empty!',fontWeight: FontWeight.w600)
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children:[
                      MyCartWidget(
                        cartItems: cartItems,
                        getQuantity: widget.getQuantity,
                        currentQuantity: 1,
                      ),
                      kHeight10,
                      const Divider(
                        thickness: 2,
                      ),
                      kHeight10,
                      CheckoutContainer(cartItems: cartItems),
                    ],
                  ),
                ),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
