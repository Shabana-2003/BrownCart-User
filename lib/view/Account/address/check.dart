// import 'package:browncart_user/view/Account/address/phonepepg.dart';
// import 'package:flutter/material.dart';

// class CheckoutPagee extends StatefulWidget {
//   const CheckoutPagee({super.key});

//   @override
//   State<CheckoutPagee> createState() => _CheckoutPageState();
// }

// class _CheckoutPageState extends State<CheckoutPagee> {
//   TextEditingController textEditingController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Checkout"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: textEditingController,
//               decoration: InputDecoration(
//                   hintText: "Enter amount", border: OutlineInputBorder()),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   PhonepePg(context: context, amount: int.parse(textEditingController.text)).init();
//                 },
//                 child: const Text("Check out"))
//           ],
//         ),
//       ),
//     );
//   }
// }