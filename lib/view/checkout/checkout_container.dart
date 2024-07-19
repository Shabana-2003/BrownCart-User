// import 'package:browncart_user/model/cart_model.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
// import 'package:flutter/material.dart';
// import '../../view/utils/constants/size/sized_box.dart';

// // ignore: must_be_immutable
// class CheckoutContainer extends StatelessWidget {
//   CheckoutContainer({
//     super.key,
//     required this.cartItems,
//   });

//   final List<Cart> cartItems;
//   int totalPrice = 0;

//   void getCartQuantityAndPrice() {
//     for (var item in cartItems) {
//       totalPrice = totalPrice + (item.itemCount * item.price);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getCartQuantityAndPrice();
//     dynamic gst = totalPrice * (18 / 100);

//     return Column(
//       children: [
//       const  Row(
//           children: <Widget>[
            
//             CommonText(size: 16, title:'Price details',fontWeight: FontWeight.w500,)
//           ],
//         ),
//         kHeight10,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
            
//            const CommonText(size: 16, title:'Total Price',fontWeight: FontWeight.w500,),
//             CommonText(size: 16, title:'₹ ${totalPrice.toString()}',fontWeight: FontWeight.w500,color: kBrown),
            
//           ],
//         ),
//         kHeight10,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//            const CommonText(size: 16, title:'GST',fontWeight: FontWeight.w500,),
//             CommonText(size: 16, title:'₹ ${gst.toString()}',fontWeight: FontWeight.w500,color:kBrown,),
            
//           ],
//         ),
//         kHeight10,
//         const Divider(
//           thickness: 2,
//         ),
//         kHeight10,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//           const  CommonText(size: 16, title:'Total amount',fontWeight: FontWeight.w500,),
//             CommonText(size: 16, title:'₹ ${totalPrice + gst}',fontWeight: FontWeight.w500,color: kBrown,),
          
//           ],
//         ),
//         kHeight10,kHeight10,
//         ElevatedButtonWidget(
//           color:const Color.fromARGB(255, 77, 44, 33),
//           onPressed: () {
//           },
//           text: 'Continue',
//         ),
//       ],
//     );
//   }
// }
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import '../../view/utils/constants/size/sized_box.dart';

// ignore: must_be_immutable
class CheckoutContainer extends StatelessWidget {
  CheckoutContainer({
    super.key,
    required this.cartItems,
  });

  final List<Cart> cartItems;
  int totalPrice = 0;

  void getCartQuantityAndPrice() {
    for (var item in cartItems) {
      totalPrice = totalPrice + (item.itemCount * item.price);
    }
  }

  @override
  Widget build(BuildContext context) {
    getCartQuantityAndPrice();
    dynamic gst = totalPrice * (18 / 100);

    return Column(
      children: [
        const Row(
          children: <Widget>[
            CommonText(size: 16, title: 'Price details', fontWeight: FontWeight.w500,)
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CommonText(size: 16, title: 'Total Price', fontWeight: FontWeight.w500,),
            CommonText(size: 16, title: '₹ ${totalPrice.toString()}', fontWeight: FontWeight.w500, color: kBrown),
          ],
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CommonText(size: 16, title: 'GST', fontWeight: FontWeight.w500,),
            CommonText(size: 16, title: '₹ ${gst.toString()}', fontWeight: FontWeight.w500, color: kBrown,),
          ],
        ),
        kHeight10,
        const Divider(
          thickness: 2,
        ),
        kHeight10,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CommonText(size: 16, title: 'Total amount', fontWeight: FontWeight.w500,),
            CommonText(size: 16, title: '₹ ${totalPrice + gst}', fontWeight: FontWeight.w500, color: kBrown,),
          ],
        ),
        kHeight10, kHeight10,
        ElevatedButtonWidget(
          color: const Color.fromARGB(255, 77, 44, 33),
          onPressed: () {
            // Implement continue to checkout logic here
          },
          text: 'Continue',
        ),
      ],
    );
  }
}
