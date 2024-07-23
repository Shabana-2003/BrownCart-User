
// import 'package:browncart_user/view/checkout/checkout_container.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:browncart_user/view/utils/constants/style/text_style.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../../view/utils/constants/size/sized_box.dart';
// import '../../model/cart_model.dart';
// import 'widgets/my_cart_widget.dart';

// class BagScreen extends StatefulWidget {
//   const BagScreen({
//     super.key,
//     required this.getQuantity,
//   });

//   final Function(int) getQuantity;

//   @override
//   State<BagScreen> createState() => _BagScreenState();
// }

// class _BagScreenState extends State<BagScreen> {
//   final user = FirebaseAuth.instance.currentUser!.email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CommonText(size: 22, title: "My Cart"),
//         centerTitle: true,
//       ),
//       body: StreamBuilder<List<Cart>>(
//         stream: Cart.getCartItems(user!),
//         builder: ((context, snapshot) {
//           if (snapshot.hasError) {
//             return  Center(
//               child: Text('Something went wrong',style: orderAddressStyle,),
//             );
//           } else if (snapshot.hasData) {
//             final cartItems = snapshot.data;
//             if (cartItems!.isEmpty) {
//               return const Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     kHeight10,
//                     CommonText(size: 16, title: 'Your cart is empty!', fontWeight: FontWeight.w600)
//                   ],
//                 ),
//               );
//             } else {
//               return SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Column(
//                     children: [
//                       MyCartWidget(
//                         cartItems: cartItems,
//                         getQuantity: widget.getQuantity,
//                         currentQuantity: 1,
//                       ),
//                       kHeight10,
//                       const Divider(
//                         thickness: 1,
//                       ),
//                       kHeight10,
//                       CheckoutContainer(cartItems: cartItems),
//                     ],
//                   ),
//                 ),
//               );
//             }
//           } else {
//             return Center(child: CircularProgressIndicator(color: kBrown,));
//           }
//         }),
//       ),
//     );
//   }
// }
import 'package:browncart_user/view/checkout/checkout_container.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import 'widgets/my_cart_widget.dart';
import '../../controller/cart_bloc/cart_bloc.dart';
import '../../controller/cart_bloc/cart_event.dart';
import '../../controller/cart_bloc/cart_state.dart';

class BagScreen extends StatefulWidget {
  const BagScreen({
    super.key,
    required this.getQuantity,
  });

  final Function(int) getQuantity;

  @override
  State<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends State<BagScreen> {
  late CartBloc _cartBloc;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  void initState() {
    super.initState();
    _cartBloc = CartBloc(user!);
    _cartBloc.add(LoadCart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(size: 22, title: "My Cart"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => _cartBloc,
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartError) {
              return Center(
                child: Text('Something went wrong', style: orderAddressStyle),
              );
            } else if (state is CartLoaded) {
              final cartItems = state.cartItems;
              if (cartItems.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      kHeight10,
                      CommonText(
                          size: 16,
                          title: 'Your cart is empty!',
                          fontWeight: FontWeight.w600)
                    ],
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      children: [
                        MyCartWidget(
                          cartItems: cartItems,
                          getQuantity: widget.getQuantity,
                          currentQuantity: 1,
                        ),
                        kHeight10,
                        const Divider(
                          thickness: 1,
                        ),
                        kHeight10,
                        CheckoutContainer(cartItems: cartItems),
                      ],
                    ),
                  ),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(color: kBrown),
              );
            }
          },
        ),
      ),
    );
  }
}
