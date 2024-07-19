// import 'package:cloud_firestore/cloud_firestore.dart';

// class Product {
//   final String productName;
//   final List<dynamic> images;
//   final dynamic description;
//   final int price;
//   final dynamic category;
//   final List<dynamic> size;
  

//   Product({
//     required this.productName,
//     required this.images,
//     required this.description,
//     required this.price,
//     required this.category,
//     required this.size
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'product': productName,
//       'images': images,
//       'description': description,
//       'category': category,
//       'price': price,
//       'size':size
//     };
//   }

//   static Product fromJson(Map<String, dynamic> json) {
   
//     print('Product data: $json');

//     int price;
//     if (json['price'] is String) {
//       price = int.tryParse(json['price']) ?? 0;
//     } else {
//       price = json['price'] ?? 0;
//     }

//     return Product(
//       productName: json['product'] ?? 'Unknown Product', 
//       images: json['images'] ?? [], 
//       description: json['description'] ?? 'No Description', 
//       price: price,
//       category: json['category'] ?? 'Uncategorized',  
//       size: json['size'] ?? []
//     );
//   }

//   static Stream<List<Product>> getProducts() {
//     return FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('Admin')
//         .collection('Products')
//         .snapshots()
//         .map((snapshots) {
//           try {
//             return snapshots.docs
//                 .map((docs) => Product.fromJson(docs.data()))
//                 .toList();
//           } catch (e) {
//             print('Error parsing product data: $e'); 
//             return [];
//           }
//         });
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String productName;
  final List<dynamic> images;
  final dynamic description;
  final int price;
  final dynamic category;
  final List<dynamic> size;

  Product({
    required this.productName,
    required this.images,
    required this.description,
    required this.price,
    required this.category,
    required this.size,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': productName,
      'images': images,
      'description': description,
      'category': category,
      'price': price,
      'size': size,
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    print('Product data: $json');

    int price;
    if (json['price'] is String) {
      price = int.tryParse(json['price']) ?? 0;
    } else {
      price = json['price'] ?? 0;
    }

    return Product(
      productName: json['product'] ?? 'Unknown Product',
      images: json['images'] ?? [],
      description: json['description'] ?? 'No Description',
      price: price,
      category: json['category'] ?? 'Uncategorized',
      size: json['size'] != null ? List<dynamic>.from(json['size']) : [],
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
            print('Error parsing product data: $e');
            return [];
          }
        });
  }
}
