import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/container_widget.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7,left: 7),
      child: StreamBuilder<List<Product>>(
        stream: Product.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: SizedBox());
          } else if (snapshot.hasError) {
            print('Stream error: ${snapshot.error}');
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            if (products.isEmpty) {
              return const Center(child: Text('Product list is empty'));
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.5, 
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ContainerWidget(product: products[index]);
                },
              );
            }
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}