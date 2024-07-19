import 'dart:async';

import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ShowDialogBox extends StatefulWidget {
  const ShowDialogBox({super.key});

  @override
  State<ShowDialogBox> createState() => _ShowDialogBoxState();
}

class _ShowDialogBoxState extends State<ShowDialogBox> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); 
  }

  showDialogBox() => showCupertinoDialog<String>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title:  Text(
            'No Connection',
            style: TextStyle(
                color: kBlack,
                fontFamily: "Gruppo-Regular"),
          ),
          content:  Text(
            'Please check your internet connectivity',
            style: TextStyle(
                color: kBlack,
                fontFamily: "Gruppo-Regular"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child:  Text(
                'OK',
                style: TextStyle(
                    color:kBlack,
                    fontFamily: "Gruppo-Regular"),
              ),
            ),
          ],
        ),
      );
}
