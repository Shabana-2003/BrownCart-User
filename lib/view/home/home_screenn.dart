import 'package:browncart_user/view/home/widgets/BannerWidget.dart';
import 'package:browncart_user/view/home/widgets/CategoryListWidget.dart';
import 'package:browncart_user/view/home/widgets/DividerWidget.dart';
import 'package:browncart_user/view/home/widgets/SearchBarWidget.dart';
import 'package:browncart_user/view/home/widgets/SectionTitleWidget.dart';
import 'package:browncart_user/view/home/widgets/custom_home_app_bar.dart';
import 'package:browncart_user/view/home/widgets/horizondal_home_gridview.dart';
import 'package:flutter/material.dart';
import 'package:browncart_user/view/home/widgets/home_grid_widget.dart';
import 'package:browncart_user/view/home/widgets/custom_brand.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/widgets/showDialogBox_internet.dart';

class HomeScreenn extends StatelessWidget {
  const HomeScreenn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomHomeAppBar(
        backgroundColor: Color.fromARGB(121, 202, 200, 198),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                kHeight10,
                SearchBarWidget(),
                kHeight10,
                CategoryListWidget(),
                BannerWidget(imagePath: "img/banner_one.jpeg"),
                SectionTitleWidget(title: "NEW ARRIVAL"),
                HomeGridView(),
                DividerWidget(),
                CustomBrand(),
                DividerWidget(),
                SectionTitleWidget(title: "COLLECTIONS"),
                BannerWidget(imagePath: "img/banner_two.jpeg"),
                SectionTitleWidget(title: "JUST FOR YOU"),
                kHeight20,
                HorizontalHomeGridView(),
                kHeight30,
                DividerWidget(),
                kHeight9,
                ShowDialogBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
