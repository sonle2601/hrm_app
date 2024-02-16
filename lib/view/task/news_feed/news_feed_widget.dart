import 'package:flutter/material.dart';

import '../../../utils/format_util.dart';
import '../../../widgets/app_text.dart';

class NewsFeedWidget extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback? onTap;
  const NewsFeedWidget({
    super.key,
    required this.title,
    required this.date,
    this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
              height: 30,
              child: Image.asset('assets/images/newspaper.png'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(text: title, fontWeight: FontWeight.bold, size: 18,),
                SizedBox(height: 10,),
                AppText(text: FormatUtils.timeAgo(date), color: Colors.black38, size: 16,)
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16,),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
