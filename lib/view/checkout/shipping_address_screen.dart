import 'package:browncart_user/model/address_model.dart';
import 'package:browncart_user/view/Account/address/address_form.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:browncart_user/view/widgets/elevated_button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final user = FirebaseAuth.instance.currentUser!.email;
  String selectedValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change address',style: wishlistTitleStyle,),
      ),
      body: StreamBuilder(
        stream: Address.getAllAddresses(user!),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong',style: bownCartText,),
            );
          } else if (snapshot.hasData) {
            final addressList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  Expanded(
                    child: addressList!.isEmpty
                        ? Center(
                            child: Text('No addresses',style: bownCartText,),
                          )
                        : Column(
                            children: [
                              ListView.separated(
                                padding: EdgeInsets.all(10),
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemBuilder: ((context, index) {
                                  return Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all()),
                                    child: Center(
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          
                                          radius: 25,
                                          backgroundColor: kWhite,
                                          child: Icon(
                                            Icons.location_on,
                                            color: kBlack,
                                          ),
                                        ),
                                        title: Text(
                                            addressList[index].addressName,style: checkOutAddressStyle,),
                                        subtitle: Text(
                                            addressList[index].addressDetails,style:myOrderstyle ,),
                                        trailing: Radio(
                                            fillColor:
                                                MaterialStateColor.resolveWith(
                                              (states) => kBrown,
                                            ),
                                            value:
                                                addressList[index].addressName,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value!;
                                              });
                                            }),
                                      ),
                                    ),
                                  );
                                }),
                                separatorBuilder: ((context, index) {
                                  return Divider();
                                }),
                                itemCount: addressList.length,
                              ),
                              kHeight30,
                              ElevatedButtonWidget(
                                onPressed: () {
                                  Navigator.pop(context, selectedValue);
                                  setState(() {});
                                },
                                text: 'Apply',
                                color: kBlack,
                              ),
                            ],
                          ),
                  ),
                  ElevatedButtonWidget(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AddressForm()),
                        ),
                      );
                    },
                    text: 'Add new address',
                    color: kBlack,
                  ),
                  kHeight20,
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: kBrown,),
            );
          }
        }),
      ),
    );
  }
}
