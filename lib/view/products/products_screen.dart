// import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
// import 'package:browncart_user/view/products/widgets/productgrid.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:flutter/material.dart';

// class ProductScreen extends StatelessWidget {
//   const ProductScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:const CustomHomeAppBar(
//         backgroundColor: Color.fromARGB(121, 202, 200, 198),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Align(
//                 alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding:const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       "RESULTS",
//                       style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500,
//                           color:kBlack,
//                           fontFamily: "Gruppo-Regular"),
//                     ),
//                   ),
//                 ),

//                 //show sort option
//               ],
//             ),
//            const ProductGrid()
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:browncart_user/view/home/widgets/selected_item_appbar.dart';
import 'package:browncart_user/view/products/widgets/productgrid.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:browncart_user/model/category_model.dart';
import 'package:browncart_user/view/home/category_screen.dart';
import 'package:flutter/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String _sortOption = 'Low to High';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectedItemAppBar(
        backgroundColor: kGrey300,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "RESULTS",
                      style: SortStyle,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.sort),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              color: kWhite,
                              child: Wrap(
                                children: [
                                  ListTile(
                                    title: Text(
                                      'Low to High',
                                      style: SortStyle,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _sortOption = 'Low to High';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text(
                                      'High to Low',
                                      style: SortStyle,
                                    ),
                                    onTap: () {
                                      setState(() {
                                        _sortOption = 'High to Low';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_alt_outlined),
                      onPressed: () {
                        showModalBottomSheet(
                          shape: Border.all(style: BorderStyle.solid),
                          backgroundColor: kWhite,
                          context: context,
                          builder: (context) {
                            return StreamBuilder<List<Category>>(
                              stream: Category.getCategories(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator(
                                    color: kBrown,
                                  ));
                                } else if (snapshot.hasError) {
                                  return const Center(
                                    child: CommonText(
                                      size: 19,
                                      title: 'Something went Wrong',
                                    ),
                                  );
                                } else if (snapshot.hasData) {
                                  final categories = snapshot.data!;
                                  if (categories.isEmpty) {
                                    return Center(
                                      child: Text('No Categories',
                                          style: orderAddressStyle),
                                    );
                                  } else {
                                    return ListView.builder(
                                      itemCount: categories.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              categories[index].category,
                                              style: SortStyle),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    CategoryScreen(
                                                  categoryName:
                                                      categories[index]
                                                          .category,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  return const Center(
                                      child: Text("Something went wrong"));
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            ProductGrid(sortOption: _sortOption),
          ],
        ),
      ),
    );
  }
}
