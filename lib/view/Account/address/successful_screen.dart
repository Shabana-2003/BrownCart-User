import 'package:browncart_user/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';


class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey300,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Order successful',
                      style: successStyle,
                    ),
                  ],
                ),
                kHeight20,
                Text(
                  'Your order will be delivered soon\nThank you for choosing our app!',
                  style: loginSubStyle,
                ),
                kHeight50,
                ElevatedButtonWidget(
                  color: kBlack,
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: ((context) => BottomNavBar()),
                        ),
                        (route) => false);
                  },
                  text: 'Continue Shopping',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
