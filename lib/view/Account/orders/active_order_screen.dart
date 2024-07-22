import 'package:browncart_user/model/order_model.dart';
import 'package:browncart_user/view/Account/orders/order_container_widget.dart';
import 'package:browncart_user/view/Account/orders/track_order_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ActiveOrderScreen extends StatelessWidget {
  ActiveOrderScreen({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: ((context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong',style:  myCartSubtitileStyle,),
          );
        } else if (snapshot.hasData) {
          List<Orders> userActiveOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.email == userEmail) {
              if (order.isCompleted == false && order.isCancelled == false) {
                userActiveOrderList.add(order);
              }
            }
          }
          return userActiveOrderList.isEmpty
              ? Center(
                  child: Text('No active orders',style:  myCartSubtitileStyle,),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    final order = userActiveOrderList[index];
                    return OrderContainer(
                  
                      order: order,
                      delivertStatus: 'In Delivery',
                      orderType: 'Track Order',
                      onTap: (() {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) =>
                                TrackOrderScreen(order: order)),
                          ),
                        );
                      }),
                    );
                  }),
                  separatorBuilder: ((context, index) => kHeight10),
                  itemCount: userActiveOrderList.length,
                );
        } else {
          return Center(
            child: CircularProgressIndicator(color: kBrown,),
          );
        }
      }),
    );
  }
}
