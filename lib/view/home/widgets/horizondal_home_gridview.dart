import 'package:browncart_user/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'container_widget.dart';

class HorizontalHomeGridView extends StatelessWidget {
  const HorizontalHomeGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9, left: 9),
      child: StreamBuilder<List<Product>>(
        stream: Product.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.white,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            print('Stream error: ${snapshot.error}');
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            final products = snapshot.data!;
            if (products.isEmpty) {
              return const Center(child: Text('Product list is empty'));
            } else {
              return SizedBox(
                height: 380, // Adjust height as needed
              
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width / 2 - 15,
                      margin: const EdgeInsets.only(right: 8),
                      child: ContainerWidget(product: products[index]),
                    );
                  },
                ),
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
