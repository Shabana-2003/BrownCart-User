// import 'package:browncart_user/model/address_model.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import '../../../view/utils/constants/size/sized_box.dart';
// import '../../../view/utils/constants/style/text_style.dart';
// import '../../Account/address/address_form.dart';
// import '../../Widgets/text_button_widget.dart';

// class MyAddresses extends StatelessWidget {
//   MyAddresses({super.key});

//   final user = FirebaseAuth.instance.currentUser!.email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'My addresses',
//           style:wishlistTitleStyle
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SafeArea(
//           child: Column(
//             children: <Widget>[
//               ListTile(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute<StatelessWidget>(
//                       builder: (BuildContext context) => AddressForm(),
//                     ),
//                   );
//                 },
//                 leading: const Icon(Icons.add),
//                 title: Text('Add new address',style: checkOutHeadStyle,),
//               ),
//               const Divider(
//                 thickness: 2,
//               ),
//               kHeight10,
//               Expanded(
//                 child: StreamBuilder(
//                   stream: Address.getAllAddresses(user!),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text('Something went wrong'),
//                       );
//                     } else if (snapshot.hasData) {
//                       final addressList = snapshot.data;
//                       if (addressList!.isEmpty) {
//                         return Center(
//                           child: Text('No addresses'),
//                         );
//                       } else {
//                         return ListView.separated(
//                           itemBuilder: ((context, index) {
//                             return Container(
//                               height: 160,
//                               width: double.infinity,
//                               //color: kLightBlue,
//                               decoration: BoxDecoration(
//                                 border: Border.all(width: 0.5, color: kBlack38),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Padding(
//                                 padding: const EdgeInsets.all(5),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding: const EdgeInsets.only(left: 5),
//                                           child: Text(
//                                             'Shipping information',
//                                             style: checkOutHeadStyle,
//                                           ),
//                                         ),
//                                         // TextButtonWidget(
//                                         //   onPressed: () {
//                                         //     Navigator.push(
//                                         //       context,
//                                         //       MaterialPageRoute<StatelessWidget>(
//                                         //         builder: (BuildContext context) => AddressForm(),
//                                         //       ),
//                                         //     );
//                                         //   },
//                                         //   text: const Text('Edit'),
//                                         // ),
//                                         TextButtonWidget(
//                                           onPressed: () async {
//                                             await Address.deleteAddress(
//                                                 user!, addressList[index]);
//                                           },
//                                           text:  Text('Delete',style: orderColorStyle,),
//                                         ),
//                                       ],
//                                     ),
//                                     kHeight10,
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Text(
//                                         addressList[index].addressName,
//                                         style: checkOutAddressStyle,
//                                       ),
//                                     ),
//                                     kHeight10,
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 5),
//                                       child: Text(
//                                         addressList[index].addressDetails,
//                                         style: checkOutAddressStyle,
//                                       ),
//                                     ),
//                                     kHeight10,
                                   
//                                   ],
//                                 ),
//                               ),
//                             );
//                           }),
//                           separatorBuilder: ((context, index) => kHeight20),
//                           itemCount: addressList.length,
//                         );
//                       }
//                     } else {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:browncart_user/view/widgets/text_botton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'address_form.dart';

class MyAddresses extends StatelessWidget {
  MyAddresses({super.key});

  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My addresses',
          style: wishlistTitleStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<StatelessWidget>(
                      builder: (BuildContext context) => AddressForm(),
                    ),
                  );
                },
                leading: const Icon(Icons.add),
                title: Text(
                  'Add new address',
                  style:bownCartText,
                ),
              ),
              const Divider(thickness: 2),
              const SizedBox(height: 10),
              Expanded(
                child: StreamBuilder(
                  stream: Address.getAllAddresses(user!),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Something went wrong'),
                      );
                    } else if (snapshot.hasData) {
                      final addressList = snapshot.data;
                      if (addressList!.isEmpty) {
                        return Center(
                          child: Text('No addresses'),
                        );
                      } else {
                        return ListView.separated(
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 160,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.5, color: Colors.black38),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            addressList[index].addressName,
                                            style: AddressStyle
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: Icon(Icons.edit,color: kBrown,),
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute<StatelessWidget>(
                                                  builder: (BuildContext context) =>
                                                      AddressForm(
                                                    address: addressList[index],
                                                    isEditing: true,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            addressList[index].addressDetails,
                                            style: textordertrack
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(thickness: 2),
                                    TextButtonWidgett(
                                      text: 'Delete address',
                                      onPressed: () {
                                        Address.deleteAddress(
                                          user!,
                                          addressList[index],
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          separatorBuilder: (context, index) {
                            return const Divider(thickness: 2);
                          },
                          itemCount: addressList.length,
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
