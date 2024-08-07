import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/view/Account/address/payment_screen.dart';
import 'package:browncart_user/view/checkout/checkout_address.dart';
import 'package:browncart_user/view/checkout/checkout_order.dart';
import 'package:browncart_user/view/checkout/total_amout.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

import '../../model/cart_model.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({
    super.key,
    required this.cartItems,
    required this.gst,
  });

  final List<Cart> cartItems;
  final double gst;
  Address address = Address(addressName: '', addressDetails: '');

  void getAddress(Address newAddress) {
    address = newAddress;
  }

  @override
  Widget build(BuildContext context) {
    double roundedGst = double.parse(gst.toStringAsFixed(2));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: wishlistTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckoutAddress(
                  callBackAddress: getAddress,
                ),
                kHeight10,
                CheckoutOrder(
                  cartItems: cartItems,
                ),
                kHeight20,
               const Divider(),
                TotalAmount(
                  cartItems: cartItems,
                  gst: roundedGst,
                ),
                kHeight20,
                ElevatedButtonWidget(
                  onPressed: () {
                    Navigator.push(
                     context,
                      MaterialPageRoute(
                        builder: ((context) => PaymentScreen(
                              address: address,
                              cartItems: cartItems,
                              gst: roundedGst,
                            )),
                      ),
                    );
                  },
                  text: 'Continue to payment',
                  color: kBlack,
                ),
                kHeight2
              ],
            ),
          ],
        ),
      ),
    );
  }
}
