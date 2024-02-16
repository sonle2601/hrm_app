import 'package:flutter/material.dart';

import '../../widgets/app_text.dart';

class ButtonHomeWidget extends StatelessWidget {
  final String image;
  final String title;
  final String content;
  final VoidCallback? onTap;
  const ButtonHomeWidget({
    super.key,
    required this.image,
    required this.content,
    this.onTap,
    required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 35,
                child: Image.asset(image)
            ),
            SizedBox(height: 5,),
            AppText(
              text: title,
              size: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 5,),
            AppText(
              color: Colors.black26,
              text: content,

              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
