import 'package:employee_manager/view/home/button_home_widget.dart';
import 'package:employee_manager/view_models/attendance_view_model.dart';
import 'package:employee_manager/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AttendanceViewModel attendanceVM = Get.put(AttendanceViewModel());

  @override
  Widget build(BuildContext context) {
    String getGreeting() {
      var now = DateTime.now();
      var hour = now.hour;

      if (hour < 12) {
        return 'Chào buổi sáng!';
      } else if (hour < 18) {
        return 'Chào buổi chiều!';
      } else {
        return 'Chào buổi tối!';
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.93),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/work.jpg'), // Đường dẫn đến tệp ảnh
                  fit: BoxFit.cover, // Để ảnh phủ đầy toàn bộ kích thước của Container
                ),
              ),
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 25, left: 20, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                          text: getGreeting(),
                          size: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          ClipOval(
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white70, // Màu sắc của đường viền
                                  width: 2, // Độ dày của đường viền
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/user.png',
                                scale: 13,// Đảm bảo hình ảnh được căn giữa và cắt theo hình tròn
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              AppText(
                                text: "Sơn Lê",
                                size: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,),
                              SizedBox(height: 5,),
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: AppText(text: "Phục vụ", size: 14, color: Colors.white,)
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
            ),
            TextButton(
              onPressed: () {
                attendanceVM.attendance();
              },
              child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      boxShadow: [
                      BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Màu sắc của đổ bóng
                      spreadRadius: 2, // Bán kính lan rộng của đổ bóng
                      blurRadius: 5, // Độ mờ của đổ bóng
                      offset: Offset(0, 3), // Vị trí của đổ bóng (dx, dy)
                              ),
                             ],
                    ),

                    child: Row(
                      children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.white70, // Màu sắc của đường viền
                                  width: 2, // Độ dày của đường viền
                                ),
                              ),
                              child: Image.asset(
                                'assets/images/touch.png',
                                scale: 11,// Đảm bảo hình ảnh được căn giữa và cắt theo hình tròn
                              ),
                         ),
                          SizedBox(width: 20,),
                          Obx(() {
                            if(attendanceVM.loading.value){
                              return Container(
                                padding: EdgeInsets.only(left: 80),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }else{
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Chấm công",
                                    size: 23,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    text: "để bắt đầu công việc!",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ],
                              );
                          }
                          }),
                      ],
                    ),
                ),
            ),
            Container(
              height: 180,
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
                              Get.toNamed(RouteName.personalSchedule);
                            },
                            title: 'Lịch làm việc',
                            image: 'assets/images/scheduling.png',
                            content: 'Xem lịch/Đổi ca',
                          ),
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: ButtonHomeWidget(
                            onTap: (){
                              Get.toNamed(RouteName.newsListScreen);
                            },
                            title: 'Bảng tin',
                            image: 'assets/images/publication.png',
                            content: 'Tin tức mới',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  // Expanded(
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: ButtonHomeWidget(
                  //           title: 'Bảng tin',
                  //           image: 'assets/images/publication.png',
                  //           content: 'Tin tức mới',
                  //         ),
                  //       ),
                  //       SizedBox(width: 15,),
                  //       Expanded(
                  //         child: ButtonHomeWidget(
                  //           title: 'Kỳ lương',
                  //           image: 'assets/images/quy.png',
                  //           content: 'Lương hiện tại',
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
    );
  }
}
