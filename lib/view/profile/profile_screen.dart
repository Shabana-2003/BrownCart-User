import 'package:browncart_user/controller/auth_bloc/bloc/auth_bloc.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_event.dart';
import 'package:browncart_user/controller/auth_bloc/bloc/auth_state.dart';
import 'package:browncart_user/view/Account/address/my_addresses.dart';
import 'package:browncart_user/view/Account/orders/order_screen.dart';
import 'package:browncart_user/view/auth/login_screen.dart';
import 'package:browncart_user/view/home/home_screen.dart';
import 'package:browncart_user/view/profile/profilePage.dart';
import 'package:browncart_user/view/profile/widgets/custom_underline.dart';
import 'package:browncart_user/view/profile/widgets/navigation_text.dart';
import 'package:browncart_user/view/settings/settings.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {


  
//    void _signOut() {
//   final authBloc = BlocProvider.of<AuthBloc>(context);
// authBloc.add(SignOut());
//   }
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:  Center(
//           child: Text(
//             'Profile',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color:kBlack,
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Center(
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const ProfilePage(),
//                     ),
//                   );
//                 },
//                 child: const CircleAvatar(
//                   radius: 50,
//                   backgroundImage: AssetImage(
//                       'img/browncart_profile.jpg'),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Hi BrownCart User',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w500,
//                   color: Color.fromARGB(255, 0, 0, 0),
//                   fontFamily: "Gruppo-Regular"),
//             ),
//             Container(
//               width: 170,
//               height: 1,
//               color:const Color.fromARGB(255, 103, 46, 8),
//             ),
//             const SizedBox(height: 64),
//             const Align(
//               alignment: Alignment.topLeft,
//               child: NavigationText(text: "Orders", targetPage: OrderScreen()),
//             ),
//             kHeight10,
//            const CustomUnderLine(),
//             kHeight10,
//              Align(
//                 alignment: Alignment.topLeft,
//                 child: NavigationText(
//                     text: "Manage Address", targetPage: MyAddresses())),
//                     kHeight10,
//           //  const CustomUnderLine(),
//           //   kHeight10,
//           //   const Align(
//           //     alignment: Alignment.topLeft,
//           //     child:
//           //         NavigationText(text: "My Wallet", targetPage: HomeScreenn()),
//           //   ),
//           //   kHeight10,
//           //  const CustomUnderLine(),
//           //   kHeight10,
//           //   const Align(
//           //     alignment: Alignment.topLeft,
//           //     child: NavigationText(text: "Coupons", targetPage: HomeScreenn()),
//           //   ),
//           //   kHeight10,
//            const CustomUnderLine(),
//             kHeight10,
//             const Align(
//                 alignment: Alignment.topLeft,
//                 child: NavigationText(
//                     text: "Change Password", targetPage: HomeScreenn())),
//                     kHeight10,
//           // const  CustomUnderLine(),
//           //   kHeight10,
//           //    Align(
//           //     alignment: Alignment.topLeft,
//           //     child: NavigationText(
//           //         text: "Share", targetPage: ProfileScreenn()),
//           //   ),
//             kHeight10,
//            const CustomUnderLine(),
//            kHeight30,kHeight100,
//             ElevatedButton(
//               onPressed: _signOut,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor:const Color.fromARGB(255, 255, 231, 200),
//                 minimumSize: const Size(210, 80),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child:  Text(
//                 'Log Out',
//                 style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color:kBlack,
//                     fontFamily: "Gruppo-Regular"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void _signOut() {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    authBloc.add(SignOut());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess && state.message == "Sign-Out Successful") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: kBlack,
                fontFamily: "Gruppo-Regular",
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const ProfilePage(),
              //         ),
              //       );
              //     },
              //     child: const CircleAvatar(
              //       radius: 50,
              //       backgroundImage: AssetImage('img/browncart_profile.jpg'),
              //     ),
              //   ),
              // ),
             Center(
  child: GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ),
      );
    },
    child: CircleAvatar(
      radius: 50,
      backgroundColor: Colors.transparent,
      child: ClipOval(
        child: Image.asset(
          'img/browncart_profile.jpg',
          fit: BoxFit.cover,
          width: 100,
          height: 100,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'img/placeholder.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            );
          },
        ),
      ),
    ),
  ),
),
              const SizedBox(height: 16),
              const Text(
                'Hi Brown Cart User',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"
                ),
              ),
              Container(
                width: 170,
                height: 1,
                color: const Color.fromARGB(255, 103, 46, 8),
              ),
              const SizedBox(height: 64),
              const Align(
                alignment: Alignment.topLeft,
                child: NavigationText(text: "Orders", targetPage: OrderScreen()),
              ),
              kHeight10,
              const CustomUnderLine(),
              kHeight10,
              Align(
                alignment: Alignment.topLeft,
                child: NavigationText(
                  text: "Manage Address", targetPage: MyAddresses()
                )
              ),
              kHeight10,
              const CustomUnderLine(),
              kHeight10,
              Align(
                alignment: Alignment.topLeft,
                child: NavigationText(
                  text: "Setting Screen", targetPage: SettingsScreen()
                ),
              ),
              kHeight10,
              const CustomUnderLine(),
              kHeight30, kHeight100,
              ElevatedButton(
                onPressed: _signOut,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 231, 200),
                  minimumSize: const Size(210, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kBlack,
                    fontFamily: "Gruppo-Regular"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
