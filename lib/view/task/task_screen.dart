import 'package:employee_manager/routes/route_name.dart';
import 'package:employee_manager/view/task/task_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_text.dart';
import '../home/button_home_widget.dart';
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
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonHomeWidget(
                              onTap: (){
                                Get.toNamed(RouteName.workSchedule);
                              },
                              title: 'Lịch chung',
                              image: 'assets/images/xem_lich.png',
                              content: 'Xem lịch làm việc chung',
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: ButtonHomeWidget(
                              onTap: (){
                                Get.toNamed(RouteName.attendanceDetailScreen);
                              },
                              title: 'Lịch sử chấm công',
                              image: 'assets/images/time-history.png',
                              content: 'Chi tiết về lịch sử chấm công',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonHomeWidget(
                              onTap: (){
                                Get.toNamed(RouteName.salaryPersonalScreen);
                              },
                              title: 'Lương dự kiến',
                              image: 'assets/images/bang_luong.png',
                              content: 'Lương ước tính của bạn',
                            ),
                          ),
                          SizedBox(width: 15,),
                          Expanded(
                            child: ButtonHomeWidget(
                              onTap: (){
                                Get.toNamed(RouteName.newsListScreen);
                              },
                              title: 'Bảng tin',
                              image: 'assets/images/thong_bao.png',
                              content: 'Các thông báo quan trọng từ quản lý',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: ButtonHomeWidget(
                    //           onTap: (){
                    //             Get.toNamed(RouteName.salaryPersonalScreen);
                    //           },
                    //           title: 'Tiền thưởng',
                    //           image: 'assets/images/thuong.png',
                    //           content: 'Tiền bạn được thưởng từ quản lý',
                    //         ),
                    //       ),
                    //       SizedBox(width: 15,),
                    //       Expanded(
                    //         child: ButtonHomeWidget(
                    //           onTap: (){
                    //             Get.toNamed(RouteName.newsListScreen);
                    //           },
                    //           title: 'Tiền phạt',
                    //           image: 'assets/images/phat.png',
                    //           content: 'Tiền bạn bị phạt từ quản lý',
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
