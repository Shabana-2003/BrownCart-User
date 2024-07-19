import 'package:browncart_user/view/profile/widgets/custom_radio_button.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String userId;
  const EditProfileScreen({super.key, required this.userId});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final CollectionReference profileCollection =
      FirebaseFirestore.instance.collection('profile');

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String _gender = 'Male';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  void _loadProfileData() async {
    DocumentSnapshot doc = await profileCollection.doc(widget.userId).get();
    if (doc.exists) {
      final data = doc.data() as Map<String, dynamic>;
      setState(() {
        _nameController.text = data['Name'] ?? '';
        _gender = data['Gender'] ?? 'Male';
        _emailController.text = data['Email'] ?? '';
        _phoneController.text = data['Phone Number'] ?? '';
      });
    }
  }

  void updateProfile() {
    final data = {
      'Name': _nameController.text,
      'Gender': _gender,
      'Email': _emailController.text,
      'Phone Number': _phoneController.text,
    };

    profileCollection.doc(widget.userId).set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Edit Profile Page',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular",
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {},
                child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('img/browncart_profile.jpg')),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  fontFamily: 'Gruppo-Regular',
                  fontSize: 20.0,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 250, 246),
              ),
              style: const TextStyle(
                fontFamily: 'Gruppo-Regular',
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20),
             Text(
              'Gender',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color:kBlack,
                fontFamily: "Gruppo-Regular",
              ),
            ),
            ListTile(
              title: const Text(
                'Male',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular",
                ),
              ),
              leading: CustomRadioButton<String>(
                value: 'Male',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                activeColor: const Color.fromARGB(255, 115, 61, 27),
              ),
            ),
            ListTile(
              title: const Text(
                'Female',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular",
                ),
              ),
              leading: CustomRadioButton<String>(
                value: 'Female',
                groupValue: _gender,
                onChanged: (String? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
                activeColor: const Color.fromARGB(255, 115, 61, 27),
              ),
            ),
            kHeight10,
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontFamily: 'Gruppo-Regular',
                  fontSize: 20.0,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 250, 246),
              ),
              style: const TextStyle(
                fontFamily: 'Gruppo-Regular',
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  fontFamily: 'Gruppo-Regular',
                  fontSize: 20.0,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 255, 250, 246),
              ),
              style: const TextStyle(
                fontFamily: 'Gruppo-Regular',
                fontSize: 20.0,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: ElevatedButton(
                onPressed: () {
                  updateProfile();
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 231, 200),
                  minimumSize: const Size(60, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color:kBlack,
                    fontFamily: "Gruppo-Regular",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
