// import 'package:browncart_user/model/address_model.dart';
// import 'package:browncart_user/view/Widgets/row_text_widget.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
// import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
// import 'package:browncart_user/view/widgets/text_form.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../utils/constants/size/sized_box.dart';
// import '../../utils/constants/style/text_style.dart';


// class AddressForm extends StatefulWidget {
//   AddressForm({super.key});

//   @override
//   State<AddressForm> createState() => _AddressFormState();
// }

// class _AddressFormState extends State<AddressForm> {
//   final TextEditingController fullNameController = TextEditingController();

//   final TextEditingController placeController = TextEditingController();

//   final TextEditingController phoneNumberController = TextEditingController();

//   final TextEditingController stateController = TextEditingController();

//   final TextEditingController pinCodeController = TextEditingController();

//   final user = FirebaseAuth.instance.currentUser!.email;

//   final formKey = GlobalKey<FormState>();

//   Future<void> addAddress({
//     required BuildContext context,
//     required String user,
//     required String addressName,
//     required String addressDetails,
//   }) async {
//     if (addressName.isEmpty) return;
//     await Address.addNewAddress(
//       user: user,
//       addressName: addressName,
//       addressDetails: addressDetails,
//     );
//     showSnackBar(
//       context,
//       'Address added successfully',
//      kBrown,
//     );
//   }

//   @override
//   void dispose() {
//     fullNameController.dispose();
//     placeController.dispose();
//     pinCodeController.dispose();
//     phoneNumberController.dispose();
//     stateController.dispose();
//     super.dispose();
//   }

// ignore_for_file: use_build_context_synchronously

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Add new address',
//           style: wishlistTitleStyle,
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: <Widget>[
//                 kHeight20,
//                 const RowTextWidget(text: 'Full name'),
//                 kHeight10,
//                 TextFormFieldWidget(
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value != null && value.length < 5) {
//                       return 'Please enter your full name';
//                     } else {
//                       return null;
//                     }
//                   },
//                   hintText: 'Enter your full name',
//                   icon: const Icon(Icons.person),
//                   controller: fullNameController,
//                 ),
//                 kHeight20,
//                 const RowTextWidget(text: 'Locality'),
//                 kHeight10,
//                 TextFormFieldWidget(
//                   keyboardType: TextInputType.text,
//                   validator: ((value) {
//                     if (value != null && value.length < 3) {
//                       return 'Enter a valid locality';
//                     }
//                     return null;
//                   }),
//                   hintText: 'Enter your locality',
//                   icon: const Icon(Icons.place),
//                   controller: placeController,
//                 ),
//                 kHeight20,
//                 const RowTextWidget(text: 'Phone number'),
//                 kHeight10,
//                 TextFormFieldWidget(
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value != null && value.length < 10) {
//                       return 'Enter a valid phone number';
//                     } else {
//                       return null;
//                     }
//                   },
//                   hintText: 'Enter your phone number',
//                   icon: const Icon(Icons.phone_android),
//                   controller: phoneNumberController,
//                 ),
//                 kHeight20,
//                 const RowTextWidget(text: 'State'),
//                 kHeight10,
//                 TextFormFieldWidget(
//                   keyboardType: TextInputType.text,
//                   validator: (value) {
//                     if (value != null && value.length < 3) {
//                       return 'Enter a valid state';
//                     } else {
//                       return null;
//                     }
//                   },
//                   hintText: 'Enter your state',
//                   icon: const Icon(Icons.place_outlined),
//                   controller: stateController,
//                 ),
//                 kHeight20,
//                 const RowTextWidget(text: 'Pincode'),
//                 kHeight10,
//                 TextFormFieldWidget(
//                   keyboardType: TextInputType.number,
//                   validator: (value) {
//                     if (value != null &&
//                         (value.length < 6 || value.length > 6)) {
//                       return 'Enter a valid pincode';
//                     } else {
//                       return null;
//                     }
//                   },
//                   hintText: 'Enter your pincode',
//                   icon: const Icon(Icons.pin),
//                   controller: pinCodeController,
//                 ),
//                 kHeight50,
//                 ElevatedButtonWidget(
//                   color: kBlack,
//                   onPressed: () async {
//                     if (!formKey.currentState!.validate()) {
//                       return;
//                     }
//                     String addressDetails =
//                         '${placeController.text.trim()}, ${stateController.text.trim()}, ${phoneNumberController.text.trim()}, ${pinCodeController.text.trim()}';
//                     await addAddress(
//                       context: context,
//                       user: user!,
//                       addressName: fullNameController.text,
//                       addressDetails: addressDetails,
//                     );
//                     Navigator.pop(context);
//                   },
//                   text: 'Add',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/view/Widgets/row_text_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:browncart_user/view/widgets/text_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/size/sized_box.dart';
import '../../utils/constants/style/text_style.dart';

class AddressForm extends StatefulWidget {
  final Address? address;
  final bool isEditing;

  const AddressForm({super.key, this.address, this.isEditing = false});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!.email;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.isEditing && widget.address != null) {
      fullNameController.text = widget.address!.addressName;
      final details = widget.address!.addressDetails.split(', ');
      if (details.length >= 4) {
        placeController.text = details[0];
        stateController.text = details[1];
        phoneNumberController.text = details[2];
        pinCodeController.text = details[3];
      }
    }
  }

  Future<void> saveAddress() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    String addressDetails =
        '${placeController.text.trim()}, ${stateController.text.trim()}, ${phoneNumberController.text.trim()}, ${pinCodeController.text.trim()}';

    final newAddress = Address(
      addressName: fullNameController.text.trim(),
      addressDetails: addressDetails,
    );

    if (widget.isEditing) {
      await Address.deleteAddress(user!, widget.address!);  // Delete the old address
      await Address.addNewAddress(  // Add the new address
        user: user!,
        addressName: newAddress.addressName,
        addressDetails: newAddress.addressDetails,
      );
    } else {
      await Address.addNewAddress(
        user: user!,
        addressName: newAddress.addressName,
        addressDetails: newAddress.addressDetails,
      );
    }

    showSnackBar(
      context,
      widget.isEditing ? 'Address updated successfully' : 'Address added successfully',
      kBrown,
    );
  
    Navigator.pop(context);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    placeController.dispose();
    pinCodeController.dispose();
    phoneNumberController.dispose();
    stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEditing ? 'Edit Address' : 'Add New Address',
          style: wishlistTitleStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                kHeight20,
                const RowTextWidget(text: 'Full name'),
                kHeight10,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.length < 5) {
                      return 'Please enter your full name';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your full name',
                  icon: const Icon(Icons.person),
                  controller: fullNameController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Locality'),
                kHeight10,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  validator: ((value) {
                    if (value != null && value.length < 3) {
                      return 'Enter a valid locality';
                    }
                    return null;
                  }),
                  hintText: 'Enter your locality',
                  icon: const Icon(Icons.place),
                  controller: placeController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Phone number'),
                kHeight10,
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && value.length < 10) {
                      return 'Enter a valid phone number';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your phone number',
                  icon: const Icon(Icons.phone_android),
                  controller: phoneNumberController,
                ),
                kHeight20,
                const RowTextWidget(text: 'State'),
                kHeight10,
                TextFormFieldWidget(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value != null && value.length < 3) {
                      return 'Enter a valid state';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your state',
                  icon: const Icon(Icons.place_outlined),
                  controller: stateController,
                ),
                kHeight20,
                const RowTextWidget(text: 'Pincode'),
                kHeight10,
                TextFormFieldWidget(
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value != null && (value.length < 6 || value.length > 6)) {
                      return 'Enter a valid pincode';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your pincode',
                  icon: const Icon(Icons.pin),
                  controller: pinCodeController,
                ),
                kHeight50,
                ElevatedButtonWidget(
                  color: kBlack,
                  onPressed: saveAddress,
                  text: widget.isEditing ? 'Save' : 'Add',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
