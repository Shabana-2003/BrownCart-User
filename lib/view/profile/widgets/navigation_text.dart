import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String text;
  final Widget targetPage;

  const NavigationText({
   super.key,
    required this.text,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          child: Text(
            text,style:const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Gruppo-Regular"),
            
          ),
         
        ),
        
      ],
    );

  }
}
