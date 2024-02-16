import 'package:flutter/material.dart';

import '../../../widgets/app_text.dart';


class PersonalScheduleTask extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback? onTap;
  const PersonalScheduleTask({
    super.key,
    required this.image,
    required this.title,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 30,
                  child: Image.asset(image)
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: title, fontWeight: FontWeight.bold, color: Colors.black87, size: 16),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 15),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15, ),
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          )
        ],
      ),
    );
  }
}
