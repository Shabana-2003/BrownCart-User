import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:browncart_user/model/category_model.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/home/widgets/category_widget.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Category>>(
      stream: Category.getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 100,
                      height: 40,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: CommonText(size: 19, title: 'Something went Wrong'),
          );
        } else if (snapshot.hasData) {
          final categories = snapshot.data!;
          if (categories.isEmpty) {
            return Center(
              child: Text('Empty', style: orderAddressStyle),
            );
          } else {
            return SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(
                    title: categories[index].category,
                  );
                },
              ),
            );
          }
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 100,
                      height: 40,
                      color: kWhite,
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
