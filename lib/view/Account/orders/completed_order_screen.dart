import 'package:browncart_user/model/order_model.dart';
import 'package:browncart_user/view/Account/orders/order_container_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CompletedOrderScreen extends StatelessWidget {
  CompletedOrderScreen({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Orders.getAllOrders(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Something went wrong'),
          );
        } else if (snapshot.hasData) {
          List<Orders> userCompletedOrderList = [];
          final orderList = snapshot.data;
          for (var order in orderList!) {
            if (order.email == userEmail) {
              if (order.isCompleted == true || order.isCancelled == true) {
                userCompletedOrderList.add(order);
              }
            }
          }
          return userCompletedOrderList.isEmpty
              ? Center(
                  child: Text('No completed orders'),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    final order = userCompletedOrderList[index];
                    return OrderContainer(
                      order: order,
                      isVisible: order.isCancelled == true ? false : true,
                      delivertStatus:
                          order.isCancelled ? 'Cancelled' : 'Completed',
                      onTap: (() {}),
                      orderType: '',
                    );
                  }),
                  separatorBuilder: ((context, index) => kHeight20),
                  itemCount: userCompletedOrderList.length,
                );
        } else {
          return Center(
            child: CircularProgressIndicator(color: kBrown,),
          );
        }
      },
    );
  }
}
