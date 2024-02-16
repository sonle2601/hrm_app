import 'package:employee_manager/utils/format_util.dart';
import 'package:employee_manager/view/task/news_feed/news_feed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';
import '../../../widgets/app_text.dart';

class NewsListScreen extends StatelessWidget {
  const NewsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.93),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Bảng tin",
          size: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
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
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
          return NewsFeedWidget(
              onTap: (){
                Get.toNamed(RouteName.newsDetailScreen);
              },
              title: 'Thông báo thưởng',
              date: '2024-04-01');
      }),
    );
  }
}
