import 'package:flutter/material.dart';

import '../../../widgets/app_text.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(.20),
          child: Container(
            height: .4,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 11, right: 11),
            color: Colors.grey,
          ),
        ),
      ),
      body: Container(
        width: 400,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                text: "Thông báo thưởng",
              fontWeight: FontWeight.bold,
              size: 20,
            ),
            SizedBox(height: 10,),
            AppText(
              text: "Đăng ngày 01-01-2024 09:56",
              color: Colors.black54,
              size: 15,
            ),
            SizedBox(height: 20,),
            AppText(text: "Chi tiết thưởng "),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/tien_thuong.png',
              ),
            )

          ],
        ),
      ),
    );
  }
}
