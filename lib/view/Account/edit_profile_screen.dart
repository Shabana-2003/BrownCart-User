import 'dart:io';
import 'package:browncart_user/model/user_model.dart';
import 'package:browncart_user/view/Account/widgets/circle_avatar_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:browncart_user/view/widgets/text_form.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../view/utils/constants/size/sized_box.dart';
import '../../../view/utils/constants/style/text_style.dart';

class EditProfileScreenn extends StatefulWidget {
  const EditProfileScreenn({super.key, required this.user});

  final UserModel user;

  @override
  State<EditProfileScreenn> createState() => _EditProfileScreenState();
}

XFile? imagePath;
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
GlobalKey<FormState> formKey = GlobalKey<FormState>();

class _EditProfileScreenState extends State<EditProfileScreenn> {
  @override
  void initState() {
    firstNameController = TextEditingController(text: widget.user.firstName);
    lastNameController = TextEditingController(text: widget.user.lastName);
    phoneNumberController =
        TextEditingController(text: widget.user.phoneNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: appBarTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                kHeight30,
                Center(
                  child: Stack(
                    children: [
                      CircleAvatarWidget(
                        radius: 60,
                        image: imagePath == null
                            ? NetworkImage(widget.user.image)
                            : FileImage(
                                File(imagePath!.path),
                              ) as ImageProvider,
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            await pickImage();
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kWhite),
                            child: const Icon(Icons.add_a_photo_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight50,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  hintText: 'First name',
                  icon: const Icon(Icons.people),
                  controller: firstNameController,
                  validator: ((value) {
                    if (value != null && value.length < 4) {
                      return 'Enter a valid name';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight30,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  hintText: 'Last name',
                  icon: const Icon(Icons.people),
                  controller: lastNameController,
                  validator: ((value) {
                    if (value != null && value.length < 2) {
                      return 'Enter a valid last name';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight30,
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  hintText: 'Phone number',
                  icon: const Icon(Icons.phone_android_outlined),
                  controller: phoneNumberController,
                  validator: ((value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value != null && value.isEmpty) {
                      return 'Enter your phone number';
                    } else if (value != null && !regExp.hasMatch(value)) {
                      return 'Enter a valid phone number';
                    } else {
                      return null;
                    }
                  }),
                ),
                kHeight80,
                ElevatedButtonWidget(
                  onPressed: (() async {
                    String? newImage;
                    if (imagePath == null) {
                      setState(() {
                        newImage = widget.user.image;
                      });
                    } else {
                      newImage = await uploadImage();
                      setState(() {});
                    }

                    final newUser = UserModel(
                      email: widget.user.email,
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      phoneNumber: phoneNumberController.text.trim(),
                      image: newImage!,
                    );
                    await UserModel.editUserDetails(user: newUser);
                    // ignore: use_build_context_synchronously
                    showSnackBar(context, 'Profile updated successfully',
                        Colors.deepPurple);
                    setState(() {});
                  }),
                  text: 'Save',
                  color: kBrown,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    setState(() {
      imagePath = image;
    });
  }

  Future<String> uploadImage() async {
    if (imagePath == null) return '';

    final path = 'file/${imagePath!.name}';
    final file = File(imagePath!.path);

    final ref = FirebaseStorage.instance.ref().child(path);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    final imageUploadUrl = snapshot.ref.getDownloadURL();
    return imageUploadUrl;
  }
}
