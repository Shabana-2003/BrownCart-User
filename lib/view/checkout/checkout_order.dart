import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';


class CheckoutOrder extends StatelessWidget {
  const CheckoutOrder({
    super.key,
    required this.cartItems,
  });

  final List<Cart> cartItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Order details',
            style: priceStyle
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: ((context, index) {
              final item = cartItems[index];
              return Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(width: 0.1, color: kBrown),
                ),
                child: Center(
                  child: ListTile(
                    leading: Container(
                      height: double.infinity,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(item.image),
                        ),
                      ),
                    ),
                    title: Text(item.productName,maxLines: 1,style:checkOutAddressStyle,),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.itemCount.toString(),style: orderColorStyle,),
                        Text('₹ ${item.price * item.itemCount}',style: orderColorStyle,),
                      ],
                    ),
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) => kHeight10),
            itemCount: cartItems.length,
          ),
        ),
      ],
    );
  }
}
