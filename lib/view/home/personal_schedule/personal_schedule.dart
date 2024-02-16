import 'package:employee_manager/view/home/personal_schedule/week_calendar_widget.dart';
import 'package:employee_manager/view/work_schedule/work_date_widget.dart';
import 'package:flutter/material.dart';

import '../../../widgets/app_text.dart';

class PersonalShcedule extends StatelessWidget {
  const PersonalShcedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Lịch làm việc",
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
      body:WeekCalendarWidget(
              onDateSelected: (time) {
                print(time);
              }
          ),
    );
  }
}
