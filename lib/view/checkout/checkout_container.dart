
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/view/checkout/checkout_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
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
    double gst = double.parse((totalPrice * (18 / 100)).toStringAsFixed(1));
    double totalAmount = totalPrice + gst;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              kHeight30, kHeight5,
              Row(
                children: <Widget>[
                  Text(
                    'Price details',
                    style: orderColorStyle,
                  ),
                ],
              ),
              kHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total Price', style: cartStyle),
                  Text('₹ ${totalPrice.toString()}', style: orderColorStyle),
                ],
              ),
              kHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('GST', style: cartStyle),
                  Text('₹ ${gst.toString()}', style: orderColorStyle),
                ],
              ),
              kHeight5,
              const Divider(
                thickness: 2,
              ),
              kHeight5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total amount', style: cartStyle),
                  Text('₹ ${totalAmount.toString()}', style: orderColorStyle),
                ],
              ),
            ],
          ),
        ),
        ElevatedButtonWidget(
          color: kBlack,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<StatelessWidget>(
                builder: (BuildContext context) => CheckoutScreen(
                  cartItems: cartItems,
                  gst: gst,
                ),
              ),
            );
          },
          text: 'Checkout',
        ),
      ],
    );
  }
}
