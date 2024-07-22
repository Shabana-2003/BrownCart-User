import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/container_widget.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: CommonText(size: 19, title: categoryName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 7,left: 7),
        child: FutureBuilder(
          future: Product.getProducts().first,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              List<Product> product = [];
              final products = snapshot.data!;
             
              for (var item in products) {
                if (item.category == categoryName) {
                  product.add(item);
                }
              }
              if (products.isEmpty) {
                return const Center(
                  child: Text('Category is empty'),
                );
              } else {
                return GridView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      childAspectRatio: 0.5,
                      mainAxisSpacing:0.5),
                  children: product
                      .map(
                        (value) => ContainerWidget(
                          product: value,
                        ),
                      )
                      .toList(),
                );
              }
            } else {
              return  Center(child: CircularProgressIndicator(color: kBrown,));
            }
          }),
        ),
      ),
    );
  }
}
