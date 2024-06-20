import 'package:browncart_user/controller/authcontroller.dart';
import 'package:browncart_user/view/home/home_screen.dart';
import 'package:browncart_user/view/profile/profilePage.dart';
import 'package:browncart_user/view/profile/widgets/custom_underline.dart';
import 'package:browncart_user/view/profile/widgets/navigation_text.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = AuthController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Profile',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 0, 0, 0),
              fontFamily: "Gruppo-Regular",
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'img/browncart_profile.jpg'), // Replace with your image asset
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Hi BrownCart User',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"),
            ),
            Container(
              width: 170,
              height: 1,
              color:const Color.fromARGB(255, 103, 46, 8),
            ),
            const SizedBox(height: 64),
            const Align(
              alignment: Alignment.topLeft,
              child: NavigationText(text: "Orders", targetPage: HomeScreen()),
            ),
            kHeight10,
           const CustomUnderLine(),
            kHeight10,
            const Align(
                alignment: Alignment.topLeft,
                child: NavigationText(
                    text: "Manage Address", targetPage: HomeScreen())),
                    kHeight10,
           const CustomUnderLine(),
            kHeight10,
            const Align(
              alignment: Alignment.topLeft,
              child:
                  NavigationText(text: "My Wallet", targetPage: HomeScreen()),
            ),
            kHeight10,
           const CustomUnderLine(),
            kHeight10,
            const Align(
              alignment: Alignment.topLeft,
              child: NavigationText(text: "Coupons", targetPage: HomeScreen()),
            ),
            kHeight10,
           const CustomUnderLine(),
            kHeight10,
            const Align(
                alignment: Alignment.topLeft,
                child: NavigationText(
                    text: "Change Password", targetPage: HomeScreen())),
                    kHeight10,
          const  CustomUnderLine(),
            kHeight10,
            const Align(
              alignment: Alignment.topLeft,
              child: NavigationText(
                  text: "Personal Information", targetPage: HomeScreen()),
            ),
            kHeight10,
           const CustomUnderLine(),
           kHeight30,
            ElevatedButton(
              onPressed: () async {
                await auth.signout();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:const Color.fromARGB(255, 255, 231, 200),
                minimumSize: const Size(210, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: "Gruppo-Regular"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
