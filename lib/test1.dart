import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/view/task/task_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_text.dart';
import 'icon_and_text.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 0.5, // Giảm bán kính lan rộng của đổ bóng
                      blurRadius: 5, // Giảm độ mờ của đổ bóng
                      offset: Offset(0, 2), // Giảm độ lệch của đổ bóng
                    ),
                  ],
                ),
                child: const Align(
                  alignment: Alignment.centerLeft, // Căn chỉnh văn bản về phía trái
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0), // Tạo khoảng cách từ lề trái
                    child: AppText(text: 'Tác vụ',size: 20),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              TaskContainer(
                components: [
                  IconAndText(
                    image: 'xem_lich.png',
                    text: "Xem lich làm việc chung",
                    onTap: (){
                      Get.toNamed(RouteName.workSchedule);
                    },
                  ),
                  // IconAndText(
                  //     onTap: (){
                  //     },
                  //     image: 'comfort.png',
                  //     text: "Đăng kí xin nghỉ"),
                ],
                title: 'Lịch làm việc',
              ),
              TaskContainer(
                components: [
                  // IconAndText(image: 'touch.png', text: "Chấm công"),
                  IconAndText(image: 'time-history.png', text: "Lịch sử chấm công"),
                  // IconAndText(image: 'addition.png', text: "Chấm công bổ sung"),
                ],
                title: 'Chấm công',
              ),
              TaskContainer(
                components: [
                  IconAndText(
                      onTap: (){
                      },
                      image: 'bang_luong.png',
                      text: "Bảng lương"),
                  // IconAndText(image: 'salary.png', text: "Xin ứng lương"),
                  IconAndText(image: 'quy.png', text: "Quỹ nhân viên"),
                ],
                title: 'Lương nhân viên',
              ),
              TaskContainer(
                components: [
                  // IconAndText(image: 'noi_quy.png', text: "Nội quy"),
                  IconAndText(image: 'thong_bao.png', text: "Thông báo"),
                ],
                title: 'Tin tức',
              ),
              SizedBox(height: 15,),
            ],
          ),
        ),
      ),
    );
  }
}
