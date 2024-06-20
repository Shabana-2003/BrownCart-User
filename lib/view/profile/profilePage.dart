import 'package:browncart_user/view/profile/widgets/custom_underline.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');

  final String userId = 'user_unique_id';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 90),
            const Text(
              'Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular",
              ),
            ),
            const SizedBox(width: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(userId: userId),
                      ),
                    ).then((_) => setState(() {}));
                  },
                  child: const Icon(Icons.edit),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {
                    bool confirmDelete = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 242, 227),
                        title: const Text(
                          'Delete Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Gruppo-Regular",
                          ),
                        ),
                        content: const Text(
                          'Are you sure you want to delete this profile?',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontFamily: "Gruppo-Regular",
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontFamily: "Gruppo-Regular",
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              'Delete',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 209, 9, 9),
                                fontFamily: "Gruppo-Regular",
                              ),
                            ),
                          ),
                        ],
                      ),
                    );

                    if (confirmDelete) {
                      await profileCollection.doc(userId).delete();
                      Navigator.pop(context);
                    }
                  },
                  child: const Icon(Icons.delete),
                ),
              ],
            )
          ],
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: profileCollection.doc(userId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error fetching profile data"));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return const Center(
                child: Text(
              "No profile data found",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular",
              ),
            ));
          }

          final profileData = snapshot.data!.data() as Map<String, dynamic>?;

          return Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: const CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            AssetImage('img/browncart_profile.jpg')),
                  ),
                ),
                const SizedBox(height: 64),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profileData?['Name'] ?? 'Name'}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Gruppo-Regular",
                    ),
                  ),
                ),
                kHeight10,
                const CustomUnderLine(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profileData?['Gender'] ?? 'Gender'}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Gruppo-Regular",
                    ),
                  ),
                ),
                kHeight10,
                const CustomUnderLine(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profileData?['Email'] ?? 'Email'}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Gruppo-Regular",
                    ),
                  ),
                ),
                kHeight10,
                const CustomUnderLine(),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${profileData?['Phone Number']?.toString() ?? 'Enter Phone Number'}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: "Gruppo-Regular",
                    ),
                  ),
                ),
                kHeight10,
                const CustomUnderLine(),
              ],
            ),
          );
        },
      ),
    );
  }
}
