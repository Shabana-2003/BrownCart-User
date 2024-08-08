import 'package:browncart_user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';
import 'widgets/circle_avatar_widget.dart';
import 'widgets/listtile_widget.dart';
import 'my_account_tile.dart';

class ProfileScreenn extends StatelessWidget {
  ProfileScreenn({super.key});

  final userEmail = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
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
                    return const Center(
                      child: Text(''),
                    );
                  } else if (snapshot.hasData) {
                    final user = snapshot.data!;
                    return Column(
                      children: [
                        CircleAvatarWidget(
                          radius: 60,
                          image: NetworkImage(user.image),
                        ),
                        kHeight20,
                        Text(
                          '${user.firstName.toUpperCase()} ${user.lastName.toUpperCase()}',
                          style: nameStyle,
                        ),
                        kHeight20,
                        ListTileWidget(
                          icon: const Icon(Icons.account_circle),
                          title: Text(
                            'My Account',
                            style: listStyle,
                          ),
                          onPress: () async {
                            final user = await UserModel.getCurrentUserData(
                              email: userEmail!,
                            );
                            Navigator.push(
                              // ignore: use_build_context_synchronously
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
                    return const CircularProgressIndicator();
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
              kHeight20,
              const Text(
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
