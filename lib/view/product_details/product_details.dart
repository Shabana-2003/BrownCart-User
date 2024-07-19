// import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
// import 'package:browncart_user/view/home/widgets/custom_product_info.dart';
// import 'package:flutter/material.dart';

// class ProductDetails extends StatefulWidget {
//   const ProductDetails({super.key});

//   @override
//   State<ProductDetails> createState() => _ProductDetailsState();
// }

// class _ProductDetailsState extends State<ProductDetails> {
//   final List<String> images = [
//     'img/zdumyimage1.jpeg',
//     'img/zdumyimage.jpeg',
//     'img/zdumyimage1.jpeg',
//   ];
//   final PageController _pageController = PageController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:const CustomHomeAppBar(  backgroundColor: Color.fromARGB(121, 202, 200, 198)),
//       body: ListView(
//         padding:const EdgeInsets.all(16),
//         children: [
          
//           SizedBox(
//             height: 500,
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: images.length,
//               itemBuilder: (context, index) {
//                 return Stack(
//                   children: [
//                     Image.asset(
//                       images[index],
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                     Positioned(
//                       bottom: 8,
//                       right: 8,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           if (index < images.length - 1) {
//                             _pageController.animateToPage(
//                               index + 1,
//                               duration:const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           } else {
//                             _pageController.animateToPage(
//                               0,
//                               duration:const Duration(milliseconds: 300),
//                               curve: Curves.easeInOut,
//                             );
//                           }
//                         },
//                         child:const Text('Next',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//          const SizedBox(height: 16),
//           // Product Name
//          const Text(
//             'Product Name',
//            style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//          const SizedBox(height: 8),
//           // Subtitle
//          const Text(
//             'Subtitle',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//         const  SizedBox(height: 16),
//           // Amount
//          const Text(
//             '\$100',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//         const  SizedBox(height: 16),
//           // Color selection
//          const Text(
//             'Color',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Wrap(
//             spacing: 8,
//             children: [
//               ChoiceChip(
//                 label:const Text('Red',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//               ChoiceChip(
//                 label:const Text('Blue',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//               ChoiceChip(
//                 label:const Text('Green',style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//             ],
//           ),
//          const SizedBox(height: 16),
//           // Size selection
//         const Text(
//             'Size',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//           Wrap(
//             spacing: 8,
//             children: [
//               ChoiceChip(
//                 label:const Text('S'),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//               ChoiceChip(
//                 label:const Text('M'),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//               ChoiceChip(
//                 label:const Text('L'),
//                 selected: false,
//                 onSelected: (selected) {},
//               ),
//             ],
//           ),
//         const  SizedBox(height: 16),
//           // Add to basket button
//           ElevatedButton(
//             onPressed: () {
//               // Add to basket logic
//             },
//             child:const Text('Add to Basket'),
//           ),
//         const  SizedBox(height: 16),
//           // Product Details
//         const  Text(
//             'Product Details',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         const  SizedBox(height: 8),
//        const   Text(
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu lacus ut nisl efficitur eleifend. Nulla facilisi. Vestibulum nec dolor eget mauris tristique lobortis. Vivamus ac sodales dui, id finibus dolor. Integer vehicula enim nec lorem ultrices vestibulum. In at justo et velit efficitur placerat eget vitae neque. Sed viverra felis at elit cursus rhoncus. Sed fringilla lectus a tellus vestibulum, id tincidunt orci eleifend. Integer id consectetur libero. Vestibulum at nunc pharetra, consequat est ut, placerat justo.',
//             style: TextStyle(
//               fontSize: 15,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//        const   SizedBox(height: 16),
//           // Other products
//         const  Text(
//             'Other Products',
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w500,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontFamily: "Gruppo-Regular",
//             ),
//           ),
//           // List of other products
//         const  CustomProductInfo()
//         ],
//       ),
//     );
//   }
// }
