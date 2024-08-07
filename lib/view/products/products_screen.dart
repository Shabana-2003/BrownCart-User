

// import 'package:browncart_user/view/home/widgets/selected_item_appbar.dart';
// import 'package:browncart_user/view/products/widgets/productgrid.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:browncart_user/view/utils/constants/style/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:browncart_user/model/category_model.dart';
// import 'package:browncart_user/view/home/category_screen.dart';
// import 'package:flutter/widgets.dart';

// class ProductScreen extends StatefulWidget {
//   const ProductScreen({super.key});

//   @override
//   _ProductScreenState createState() => _ProductScreenState();
// }

// class _ProductScreenState extends State<ProductScreen> {
//   String _sortOption = 'Low to High';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: SelectedItemAppBar(
//         backgroundColor: kGrey300,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10, top: 10),
//                     child: Text(
//                       "RESULTS",
//                       style: SortStyle,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.sort),
//                       onPressed: () {
//                         showModalBottomSheet(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return Container(
//                               color: kWhite,
//                               child: Wrap(
//                                 children: [
//                                   ListTile(
//                                     title: Text(
//                                       'Low to High',
//                                       style: SortStyle,
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _sortOption = 'Low to High';
//                                       });
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                   ListTile(
//                                     title: Text(
//                                       'High to Low',
//                                       style: SortStyle,
//                                     ),
//                                     onTap: () {
//                                       setState(() {
//                                         _sortOption = 'High to Low';
//                                       });
//                                       Navigator.pop(context);
//                                     },
//                                   ),
//                                 ],
//                               ),
//                             );
//                           },
//                         );
//                       },
//                     ),
//                     IconButton(
//                       icon: const Icon(Icons.filter_alt_outlined),
//                       onPressed: () {
//                         showModalBottomSheet(
//                           shape: Border.all(style: BorderStyle.solid),
//                           backgroundColor: kWhite,
//                           context: context,
//                           builder: (context) {
//                             return StreamBuilder<List<Category>>(
//                               stream: Category.getCategories(),
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return Center(
//                                       child: CircularProgressIndicator(
//                                     color: kBrown,
//                                   ));
//                                 } else if (snapshot.hasError) {
//                                   return const Center(
//                                     child: CommonText(
//                                       size: 19,
//                                       title: 'Something went Wrong',
//                                     ),
//                                   );
//                                 } else if (snapshot.hasData) {
//                                   final categories = snapshot.data!;
//                                   if (categories.isEmpty) {
//                                     return Center(
//                                       child: Text('No Categories',
//                                           style: orderAddressStyle),
//                                     );
//                                   } else {
//                                     return ListView.builder(
//                                       itemCount: categories.length,
//                                       itemBuilder: (context, index) {
//                                         return ListTile(
//                                           title: Text(
//                                               categories[index].category,
//                                               style: SortStyle),
//                                           onTap: () {
//                                             Navigator.of(context).push(
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     CategoryScreen(
//                                                   categoryName:
//                                                       categories[index]
//                                                           .category,
//                                                 ),
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       },
//                                     );
//                                   }
//                                 } else {
//                                   return const Center(
//                                       child: Text("Something went wrong"));
//                                 }
//                               },
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             ProductGrid(sortOption: _sortOption),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:browncart_user/controller/product_bloc/product_bloc.dart';
import 'package:browncart_user/controller/product_bloc/product_event.dart';
import 'package:browncart_user/controller/product_bloc/product_state.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/container_widget.dart';
import 'package:browncart_user/view/home/widgets/selected_item_appbar.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}
// product_screen.dart
class _ProductScreenState extends State<ProductScreen> {
  String _sortOption = 'Low to High';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectedItemAppBar(
        backgroundColor: kGrey300,
      ),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(LoadProducts()),
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
                                    title: Text('Low to High', style: SortStyle),
                                    onTap: () {
                                      setState(() {
                                        _sortOption = 'Low to High';
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: Text('High to Low', style: SortStyle),
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
                  ],
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductError) {
                    return Center(child: Text('Error: ${state.error}'));
                  } else if (state is ProductLoaded) {
                    List<Product> products = state.products;

                  
                    if (_sortOption == 'Low to High') {
                      products.sort((a, b) => a.price.compareTo(b.price));
                    } else if (_sortOption == 'High to Low') {
                      products.sort((a, b) => b.price.compareTo(a.price));
                    }

                    return GridView.builder(
                      padding: const EdgeInsets.all(8.0),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ContainerWidget(product: products[index]);
                      },
                    );
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
