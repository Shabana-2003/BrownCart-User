import 'package:browncart_user/model/order_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer(
      {super.key,
      required this.order,
      required this.delivertStatus,
      this.isVisible = true,
      required this.onTap,
      required this.orderType});

  final Orders order;
  final String delivertStatus;
  final bool isVisible;
  final Function() onTap;
  final String orderType;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color:  kLightGreayy,
      width: double.infinity,
      
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.20,
            width: screenHeight * 0.10,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(order.image),
              ),
            
            ),
          ),
          kWidth10,
          kHeight10,
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.160,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.productName,style:  myOrderstyle,maxLines: 1,
                  ),
                  Text('Quantity : ${order.cartCount},',style:  myOrderstyle,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(delivertStatus,style:  myOrderstyle,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹ ${order.price}.00',
                        style:  orderColorStyle
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Visibility(
                          visible: isVisible,
                          child: GestureDetector(
                            onTap: onTap,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                orderType,
                                style:  orderColorStyle
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
