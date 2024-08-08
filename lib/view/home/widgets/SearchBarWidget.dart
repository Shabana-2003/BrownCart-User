import 'package:flutter/material.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/search_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() async {
        List<Product> allProductsList = await Product.getProducts().first;
        PersistentNavBarNavigator.pushNewScreen(
          // ignore: use_build_context_synchronously
          context,
          screen: SearchScreen(allProductsList: allProductsList),
          withNavBar: false,
        );
      }),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Row(
          children: [
            kWidth10,
            const Icon(Icons.search),
            kWidth10,
            const CommonText(size: 16, title: 'Search for products'),
          ],
        ),
      ),
    );
  }
}
