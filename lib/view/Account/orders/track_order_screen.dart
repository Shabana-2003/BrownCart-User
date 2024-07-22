import 'package:another_stepper/another_stepper.dart';
import 'package:browncart_user/model/order_model.dart';
import 'package:browncart_user/view/Account/orders/order_container_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrackOrderScreen extends StatelessWidget {
  TrackOrderScreen({
    super.key,
    required this.order,
  });

  final Orders order;

  List<StepperData> stepperData = [
    StepperData(
      title: StepperText(
        "Order Placed",textStyle: orderAddressStyle
      ),
      subtitle: StepperText("Your order has been placed",textStyle: textordertrack),
    ),
    StepperData(
      title: StepperText(
        "Packed",textStyle: orderAddressStyle
      ),
      subtitle: StepperText("Your order is being prepared",textStyle: textordertrack),
    ),
    StepperData(
      title: StepperText(
        "Out for Delivery",textStyle: orderAddressStyle
      ),
      subtitle: StepperText(
        "Our delivery executive is on the way to deliver your item",textStyle: textordertrack
      ),
    ),
    StepperData(
      title: StepperText(
        "Delivered",textStyle:  orderAddressStyle
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track order',style:  bownCartText),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              OrderContainer(
                
                order: order,
                delivertStatus: 'In Delivery',
                onTap: () {},
                orderType: '',
              ),
              kHeight20,
              Text('Order status details',style: orderAddressStyle,),
              kHeight20,
              AnotherStepper(
                activeIndex: order.deliveryType,
                stepperList: stepperData,
                stepperDirection: Axis.vertical,
                verticalGap: 50,
               // activeBarColor: kBrown,
                activeBarColor: kBrown, // Set the color for the active step
                inActiveBarColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
