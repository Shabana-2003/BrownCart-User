// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   final String productName;
//   final List<dynamic> images;
//   final dynamic description;
//   final int price;
//   final dynamic category;
//   Product({
//     required this.productName,
//     required this.images,
//     required this.description,
//     required this.price,
//     required this.category,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'product': productName,
//       'images': images,
//       'description': description,
//       'category': category,
//       'price': price
//     };
//   }

//   static Product fromJson(Map<String, dynamic> json) {
//     return Product(
//       productName: json['product'],
//       images: json['images'],
//       description: json['description'],
//       price: json['price'],
//       category: json['category'],
//     );
//   }

//   static Stream<List<Product>> getProducts() {
//     return FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('Admin')
//         .collection('Products')
//         .snapshots()
//         .map(
//           (snapshots) => snapshots.docs
//               .map((docs) => Product.fromJson(docs.data()))
//               .toList(),
//         );
//   }

// }
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String productName;
  final List<dynamic> images;
  final dynamic description;
  final int price;
  final dynamic category;

  Product({
    required this.productName,
    required this.images,
    required this.description,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productName,
      'images': images,
      'description': description,
      'category': category,
      'price': price
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    // Debugging line
    print('Product data: $json');

    // Handle potential type issues gracefully
    int price;
    if (json['price'] is String) {
      price = int.tryParse(json['price']) ?? 0;
    } else {
      price = json['price'] ?? 0;
    }

    return Product(
      productName: json['product'] ?? 'Unknown Product',  // Fallback for null
      images: json['images'] ?? [],  // Fallback for null
      description: json['description'] ?? 'No Description',  // Fallback for null
      price: price,
      category: json['category'] ?? 'Uncategorized',  // Fallback for null
    );
  }

  static Stream<List<Product>> getProducts() {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('Admin')
        .collection('Products')
        .snapshots()
        .map((snapshots) {
          try {
            return snapshots.docs
                .map((docs) => Product.fromJson(docs.data()))
                .toList();
          } catch (e) {
            print('Error parsing product data: $e');  // Error logging
            return [];
          }
        });
  }
}
