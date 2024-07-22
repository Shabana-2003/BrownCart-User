import 'package:browncart_user/model/user_model.dart';
import 'package:browncart_user/view/Account/orders/order_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
//import '../../model/google_sign_in.dart';
import 'widgets/circle_avatar_widget.dart';
import 'widgets/listtile_widget.dart';
import 'my_account_tile.dart';
import 'address/my_addresses.dart';

class ProfileScreenn extends StatelessWidget {
  ProfileScreenn({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    // final User user = FirebaseAuth.instance
    //     .currentUser!; // Now we can access the information of the loggedin user

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              FutureBuilder<UserModel>(
                future: UserModel.getCurrentUserData(email: userEmail!),
                builder: ((context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(''),
                    );
                  } else if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return Column(
                      children: [
                        CircleAvatarWidget(
                          radius: 60,
                          image: NetworkImage(user.image),
                          // NetworkImage(user.photoURL!),// It will access the photo url of the user
                        ),
                        kHeight20,
                        Text(
                          user.firstName.toUpperCase() +
                              ' ' +
                              user.lastName.toUpperCase(),
                          style: nameStyle,
                        ),
                        kHeight20,
                        ListTileWidget(
                          icon: const Icon(Icons.account_circle),
                          title: Text('My Account',style: listStyle,),
                          onPress: () async {
                            final user = await UserModel.getCurrentUserData(
                              email: userEmail!,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute<StatelessWidget>(
                                builder: (BuildContext context) =>
                                    MyAccountTile(user: user),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
              ),
              ListTileWidget(
                icon: const Icon(Icons.share_rounded),
                title: Text(
                  'Share',
                  style: listStyle,
                ),
                onPress: () async {
                  await Share.share(
                      'Download BrownCart from Amazon App Store For Free \nWith BrownCart you purchase women outfits, formals and casuals of various brands. Download Now On Amazon App Store');
                },
              ),
              // ListTileWidget(
              //   icon: const Icon(Icons.security_rounded),
              //   title: Text(
              //     'Privacy policy',
              //     style: listStyle,
              //   ),
              //   onPress: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: ((context) =>
              //             SettingsScreenWidget(screenName: 'Privacy Policy')),
              //       ),
              //     );
              //   },
              // ),
              // ListTileWidget(
              //   icon: const Icon(Icons.policy_rounded),
              //   title: Text(
              //     'Terms and conditions',
              //     style: listStyle,
              //   ),
              //   onPress: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: ((context) => SettingsScreenWidget(
              //               screenName: 'Terms And Conditions',
              //             )),
              //       ),
              //     );
              //   },
              // ),
             
              kHeight20,
              Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  color: Colors.black26,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
