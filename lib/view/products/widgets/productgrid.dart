
// import 'package:browncart_user/model/product_model.dart';
// import 'package:browncart_user/view/home/widgets/container_widget.dart';
// import 'package:browncart_user/view/utils/constants/style/text_style.dart';
// import 'package:flutter/material.dart';

// class ProductGrid extends StatelessWidget {
//   const ProductGrid({super.key, required this.sortOption});

//   final String sortOption;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 7, left: 7),
//       child: StreamBuilder<List<Product>>(
//         stream: Product.getProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: SizedBox());
//           } else if (snapshot.hasError) {
//             print('Stream error: ${snapshot.error}');
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (snapshot.hasData) {
//             List<Product> products = snapshot.data!;
//             if (products.isEmpty) {
//               return Center(child: Text('Product list is empty',style:SortStyle ,));
//             } else {
//               if (sortOption == 'Low to High') {
//                 products.sort((a, b) => a.price.compareTo(b.price));
//               } else if (sortOption == 'High to Low') {
//                 products.sort((a, b) => b.price.compareTo(a.price));
//               }

//               return GridView.builder(
//                 shrinkWrap: true,
//                 physics: const ScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 8,
//                   crossAxisSpacing: 10,
//                   childAspectRatio: 0.5,
//                 ),
//                 itemCount: products.length,
//                 itemBuilder: (context, index) {
//                   return ContainerWidget(product: products[index]);
//                 },
//               );
//             }
//           } else {
//             return const Center(child: Text("Something went wrong"));
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:browncart_user/controller/product_bloc/product_bloc.dart';
import 'package:browncart_user/controller/product_bloc/product_state.dart';
import 'package:browncart_user/view/home/widgets/container_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator(color: kBrown));
          } else if (state is ProductError) {
            return Center(child: Text(state.error));
          } else if (state is ProductLoaded) {
            if (state.products.isEmpty) {
              return Center(child: Text('No Products Available', style: SortStyle));
            } else {
              print('Products loaded: ${state.products}');
              return GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.5,
                ),
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  return ContainerWidget(product: state.products[index]);
                },
              );
            }
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
