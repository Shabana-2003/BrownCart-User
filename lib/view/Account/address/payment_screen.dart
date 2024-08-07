import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/model/cart_model.dart';
import 'package:browncart_user/model/order_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import 'successful_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({
    super.key,
    required this.address,
    required this.cartItems,
    required this.gst,
  });

  final Address address;
  final List<Cart> cartItems;
  final double gst;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedValue = 0;
  final user = FirebaseAuth.instance.currentUser!.email;

  double getTotal() {
    double amount = 0;
    for (var item in widget.cartItems) {
      amount = amount + (item.price * item.itemCount);
    }
    return amount + widget.gst;
  }

  Future<void> onPaymentSuccessfull({required String payment}) async {
    for (var item in widget.cartItems) {
      int id = DateTime.now().millisecondsSinceEpoch;
      double amount = getTotal();
      await Orders.addOrder(
        email: user!,
        id: 'Order$id',
        cartItem: item,
        price: amount.toInt(),
        payment: payment,
        address:
            '${widget.address.addressName} ${widget.address.addressDetails}',
      );
      await Cart.deleteCartItem(user: user!, cartItem: item);
    }
  }
  // Razorpay instance

  final _razorpay = Razorpay();

  // Event listeners

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });

    super.initState();
  }

  // Event handlers

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    onPaymentSuccessfull(payment: 'Razorpay').then((value) {
      Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: ((context) => SuccessfulScreen()),
        ),
      );
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    showSnackBar(context, 'Transaction failed', Colors.red);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: bownCartText,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                kHeight20,
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: kGrey300,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5, color: kBlack38),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Payment methods',
                              style: checkOutHeadStyle,
                            ),
                          ],
                        ),
                        kHeight10,
                        Column(
                          children: <Widget>[
                            RadioListTile<int>(
                              activeColor: kBrown,
                              value: 0,
                              groupValue: selectedValue,
                              title:  Text('RazorPay',style: myCartSubtitileStyle,),
                              onChanged: (int? value) => setState(() {
                                selectedValue = 0;
                              }),
                            ),
                            RadioListTile<int>(
                              activeColor: kBrown,
                              value: 1,
                              groupValue: selectedValue,
                              title:  Text('Cash on delivery',style: myCartSubtitileStyle,),
                              onChanged: (int? value) => setState(() {
                                selectedValue = 1;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                kHeight50,
                ElevatedButtonWidget(
                  color: kBlack,
                  onPressed: () async {
                    double amount = getTotal();
                    var options = {
                      'key': 'rzp_test_6HsuV5NiUVTbD7',
                      'amount': amount * 100,
                      'name': 'BROWNCART Pvt.Ltd',
                      'description': 'Demo ',
                      'prefill': {
                        'contact': '9605806440',
                        'email': 'mashabana751@gmail.com'
                      }
                    };

                    if (selectedValue == 1) {
                      await onPaymentSuccessfull(payment: 'COD').then((value) =>
                          Navigator.of(context, rootNavigator: true).push(
                            MaterialPageRoute(
                              builder: ((context) => SuccessfulScreen()),
                            ),
                          ));
                    } else {
                      _razorpay.open(options);
                    }
                  },
                  text: 'Confirm and Pay',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
