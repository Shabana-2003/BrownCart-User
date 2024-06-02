import 'package:browncart_user/view/menu/widgets/detail_page.dart';
import 'package:flutter/material.dart';

class CategoryListView extends StatelessWidget {
  final List<String> items;

  const CategoryListView({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index],style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular",
              ),),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: items[index]),
              ),
            );
          },
        );
      },
    );
  }
}
