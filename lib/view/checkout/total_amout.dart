
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class TotalAmount extends StatelessWidget {
  TotalAmount({super.key, required this.cartItems, required this.gst});

  final List<Cart> cartItems;
  final double gst;
  int amount = 0;
  double includingGst = 0;

  void getTotalAmount() {
    for (var item in cartItems) {
      amount = amount + (item.price * item.itemCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    getTotalAmount();
    double roundedGst = double.parse((amount * (gst / 100)).toStringAsFixed(2));
    double totalWithGst = amount + roundedGst;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 0.3,
            color: kBrown,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              kHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Amount',
                    style: priceStyle,
                  ),
                  Text(
                    '₹ $amount',
                    style: orderColorStyle,
                  ),
                ],
              ),
              kHeight20,
              Divider(),
              kHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: priceStyle,
                  ),
                  Text(
                    '( + 18% GST)',
                    style: priceStyle,
                  ),
                  kWidth20,
                  Text(
                    '₹ ${totalWithGst.toStringAsFixed(1)}',
                    style: orderColorStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
