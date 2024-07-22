import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/view/Account/address/address_form.dart';
import 'package:browncart_user/view/checkout/shipping_address_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class CheckoutAddress extends StatelessWidget {
  CheckoutAddress({
    super.key,
    required this.callBackAddress,
  });

  final user = FirebaseAuth.instance.currentUser!.email;
  final void Function(Address) callBackAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight10,
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            'Shipping address',
            style:priceStyle
          ),
        ),
        FutureBuilder<List<Address>>(
          future: Address.getAllAddresses(user!).first,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong',style: priceStyle,),
              );
            } else if (snapshot.hasData) {
              final addressList = snapshot.data;
              if (addressList!.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Please add an address to proceed to payment',style:checkOutAddressStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => AddressForm()),
                              ),
                            );
                          },
                          icon: Icon(Icons.add,color: kBrown,),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                Address address = Address(
                  addressName: addressList[0].addressName,
                  addressDetails: addressList[0].addressDetails,
                );
                callBackAddress(address);
                return StatefulBuilder(
                  builder: ((context, setState) {
                    final screenHeight = MediaQuery.of(context).size.height;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        
                        height: screenHeight * 0.19,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            width: 0.1,
                            color: kBrown,
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 0,
                                backgroundColor: kWhite,
                                child: Icon(
                                  Icons.location_on,
                                  color: kBrown,
                                ),
                              ),
                              title: Text(address.addressName,style: priceStyle,),
                              subtitle: Text(address.addressDetails,style: checkOutAddressStyle,),
                            ),
                            Divider(thickness: 0.8),
                            GestureDetector(
                              onTap: (() async {
                                final addressName =
                                    await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) => ShippingAddress()),
                                  ),
                                );
                                for (var item in addressList) {
                                  if (item.addressName == addressName) {
                                    setState(() {
                                      address = Address(
                                        addressName: item.addressName,
                                        addressDetails: item.addressDetails,
                                      );
                                    });
                                  }
                                }
                                callBackAddress(address);
                              }),
                              child: Text(
                                'Change address',
                                style: priceStyle
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ],
    );
  }
}
