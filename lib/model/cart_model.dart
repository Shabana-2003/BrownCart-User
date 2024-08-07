// import 'package:cloud_firestore/cloud_firestore.dart';

// class Cart {
//   final String productName;
//   final String image;
//   final int price;
//   final int itemCount;

//   Cart({
//     required this.productName,
//     required this.image,
//     required this.price,
//     required this.itemCount,
//   });

//   Map<String, dynamic> toJson() {
//     return {
//       'productName': productName,
//       'image': image,
//       'price': price,
//       'itemCount': itemCount
//     };
//   }

//   static Cart fromJson(Map<String, dynamic> json) {
//     return Cart(
//       productName: json['productName'],
//       image: json['image'],
//       price: json['price'],
//       itemCount: json['itemCount'],
//     );
//   }

//   static Future<void> addToCart({
//     required String user,
//     required String productName,
//     required String image,
//     required int price,
//     required int itemCount,
//   }) async {
//     final docUser = FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('User')
//         .collection('Profile')
//         .doc(user)
//         .collection('Cart')
//         .doc(productName);

//     final cart = Cart(
//       productName: productName,
//       image: image,
//       price: price,
//       itemCount: itemCount,
//     );

//     final json = cart.toJson();
//     await docUser.set(json);
//   }

//   static Future<void> updateCart({
//     required Cart cartItem,
//     required int quantity,
//     required String user,
//   }) async {
//     final docUser = FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('User')
//         .collection('Profile')
//         .doc(user)
//         .collection('Cart')
//         .doc(cartItem.productName);
//     final cart = Cart(
//       productName: cartItem.productName,
//       image: cartItem.image,
//       price: cartItem.price,
//       itemCount: quantity,
//     );

//     final json = cart.toJson();
//     await docUser.update(json);
//   }

//   static Future<void> deleteCartItem({
//     required String user,
//     required Cart cartItem,
//   }) async {
//     FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('User')
//         .collection('Profile')
//         .doc(user)
//         .collection('Cart')
//         .doc(cartItem.productName)
//         .delete();
//   }

//   static Stream<List<Cart>> getCartItems(String user) {
//     return FirebaseFirestore.instance
//         .collection('myApp')
//         .doc('User')
//         .collection('Profile')
//         .doc(user)
//         .collection('Cart')
//         .snapshots()
//         .map(
//           (snapshot) => snapshot.docs
//               .map(
//                 (doc) => Cart.fromJson(
//                   doc.data(),
//                 ),
//               )
//               .toList(),
//         );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  final String productName;
  final String image;
  final int price;
  final int itemCount;
  final String selectedSize;

  Cart({
    required this.productName,
    required this.image,
    required this.price,
    required this.itemCount,
    required this.selectedSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'image': image,
      'price': price,
      'itemCount': itemCount,
      'selectedSize': selectedSize,
    };
  }

  static Cart fromJson(Map<String, dynamic> json) {
    return Cart(
      productName: json['productName'],
      image: json['image'],
      price: json['price'],
      itemCount: json['itemCount'],
      selectedSize: json['selectedSize'],
    );
  }

  Cart copyWith({
    String? productName,
    String? image,
    int? price,
    int? itemCount,
    String? selectedSize,
  }) {
    return Cart(
      productName: productName ?? this.productName,
      image: image ?? this.image,
      price: price ?? this.price,
      itemCount: itemCount ?? this.itemCount,
      selectedSize: selectedSize ?? this.selectedSize,
    );
  }

  static Future<void> addToCart({
    required String user,
    required String productName,
    required String image,
    required int price,
    required int itemCount,
    required String selectedSize,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(productName);

    final cart = Cart(
      productName: productName,
      image: image,
      price: price,
      itemCount: itemCount,
      selectedSize: selectedSize,
    );

    final json = cart.toJson();
    await docUser.set(json);
  }

  static Future<void> updateCart({
    required Cart cartItem,
    required int quantity,
    required String user,
  }) async {
    final docUser = FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(cartItem.productName);
    final cart = Cart(
      productName: cartItem.productName,
      image: cartItem.image,
      price: cartItem.price,
      itemCount: quantity,
      selectedSize: cartItem.selectedSize,
    );

    final json = cart.toJson();
    await docUser.update(json);
  }

  static Future<void> deleteCartItem({
    required String user,
    required Cart cartItem,
  }) async {
    FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(cartItem.productName)
        .delete();
  }

  static Stream<List<Cart>> getCartItems(String user) {
    return FirebaseFirestore.instance
        .collection('myApp')
        .doc('User')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => Cart.fromJson(
                  doc.data(),
                ),
              )
              .toList(),
        );
  }
}
