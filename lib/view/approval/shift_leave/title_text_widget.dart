import 'package:flutter/material.dart';

import '../../../widgets/app_text.dart';

class TitleTextWidget extends StatelessWidget {
  final String title;
  final String text;
  final int? maxLine;
  const TitleTextWidget({
    super.key,
    required this.title,
    required this.text,
    this.maxLine = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(text: title),
              Container(
                width: MediaQuery.of(context).size.width*4/7,
                  child: AppText(text: text)
              ),
            ],
          ),
          SizedBox(height: 15,),

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
            height: 1,
          ),
        ],
      )
    );
  }
}
