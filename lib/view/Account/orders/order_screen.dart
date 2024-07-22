import 'package:browncart_user/view/Account/orders/active_order_screen.dart';
import 'package:browncart_user/view/Account/orders/completed_order_screen.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';


class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar( 
          title: Text(
            'My Orders',
            style: bownCartText,
          ),
          centerTitle: true,
          bottom:  TabBar(
            labelPadding:const EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            tabs: [
              Text('Active',style: myCartSubtitileStyle),
              Text('Completed',style:  myCartSubtitileStyle),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActiveOrderScreen(),
            CompletedOrderScreen(),
          ],
        ),
      ),
    );
  }
}
