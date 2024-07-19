import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/widgets/container_widget.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/widgets/text_form.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.allProductsList});

  final List<Product> allProductsList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? searchProductList;

  @override
  void initState() {
    searchProductList =
        List.from(widget.allProductsList.cast<Product>().toList());
    super.initState();
  }

  void searchProduct(String value) {
    setState(() {
      searchProductList = widget.allProductsList
          .where((product) =>
              product.productName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const CommonText(size: 25, title: 'Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormFieldWidget(
                keyboardType: TextInputType.text,
                hintText: 'Search',
                
                icon:const Icon(Icons.search),
                
                onChanged: (value) {
                  searchProduct(value);
                },
              ),
              kHeight10,
              (searchProductList!.isEmpty)
                  ? const Center(
                  child:CommonText(size: 16, title:"No Products Found"),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      physics:const ScrollPhysics(),
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 9,
                        childAspectRatio: 0.5,
                      ),
                      itemBuilder: (context, index) {
                        final product = searchProductList![index];
                        return ContainerWidget(product: product);
                      },
                      itemCount: searchProductList!.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
