// import 'package:browncart_user/view/home/category_screen.dart';
// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:flutter/material.dart';

// class CategoryWidget extends StatefulWidget {
//   const CategoryWidget({
//     super.key,
//     required this.title,
//     this.onTap,
//   });

//   final dynamic title;
//   final Function()? onTap;

//   @override
//   State<CategoryWidget> createState() => _CategoryWidgetState();
// }

// class _CategoryWidgetState extends State<CategoryWidget> {

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5),
//       child: GestureDetector(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: ((context) => CategoryScreen(
//                     categoryName: widget.title,
//                   )
//                 ),
//             ),
//          );
//         },
//         child: Container(
//           width: 120,
//           height: 80,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               20,
//             ),
//             color:const Color.fromARGB(255, 91, 49, 23),
//           ),
//           child: Center(
//             child: 
//             CommonText(
//           size: 12,
//           title: '${widget.title}',
//           color: const Color.fromARGB(255, 255, 255, 255),
//           fontWeight: FontWeight.w600,
//         ),
//           ),
//         ),
//       ),
//     );
//   }
// }import 'package:browncart_user/view/home/category_screen.dart';
import 'package:browncart_user/view/home/category_screen.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  final dynamic title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () {
          if (onTap != null) {
            onTap!();
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => CategoryScreen(
                      categoryName: title,
                    )),
              ),
            );
          }
        },
        child: Container(
          width: 120,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 91, 49, 23),
          ),
          child: Center(
            child: CommonText(
              size: 12,
              title: '$title',
              color: const Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
