import 'package:browncart_user/view/menu/widgets/category_listview.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title:const Center(
            child:Text('Menu',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular",
                ),),
          ),
          bottom:const TabBar(
            
            labelColor: Color.fromARGB(255, 117, 58, 24), // Color for selected tab
            unselectedLabelColor: Colors.grey, // Color for unselected tabs
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: "Gruppo-Regular",
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Formals'),
              Tab(text: 'Casuals'),
            ],
          ),
        
        ),
        body: const TabBarView(
          children: [
            CategoryListView(
              items: ['New', 'Dress', 'Shirt', 'T-Shirt', 'Skirts', 'Pants', 'Denim'],
            ),
            CategoryListView(
              items: ['Formal Shirt', 'Formal Pants', 'Blazer', 'Suit', 'Tie', 'Formal Shoes'],
            ),
            CategoryListView(
              items: ['Casual Shirt', 'Jeans', 'T-Shirt', 'Shorts', 'Sneakers', 'Casual Shoes'],
            ),
          ],
        ),
      ),
    );
  }
}