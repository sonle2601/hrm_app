import 'package:employee_manager/widgets/app_text.dart';
import 'package:employee_manager/widgets/button_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_models/employee_view_model.dart';
import '../view_models/user_prefrence_view_model.dart';

class InviteScreen extends StatelessWidget {
  InviteScreen({Key? key});

  final _userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    final employeeVM = Get.put(EmployeeViewModel());
    employeeVM.getInvite();

    return FutureBuilder<String>(
      future: _userPreference.getScreenStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        final screenStatus = snapshot.data;

        if (screenStatus == 'waiting') {
          return Scaffold(
            body: Stack(
              children: [
                // Background image
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_invite.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Main content
                Column(
                  children: [
                    SizedBox(height: 60),
                    Obx(() {
                      final employee = employeeVM.employee.value;
                      if (employeeVM.loadData.value) {
                        return Column(
                          children: [
                            Center(
                              child: AppText(
                                maxLines: 2,
                                text: "Lời mời làm việc từ \n${employee.store?.ten ?? ''}",
                                size: 25,
                                color: Colors.green,
                                textAlign: TextAlign.center,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(30),
                              padding: EdgeInsets.all(20),
                              height: 400,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    AppText(
                                      text: "Thông tin lời mời",
                                      size: 18, fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 15,),
                                    AppText(text: 'Bộ phận'),
                                    SizedBox(height: 5,),
                                    AppText(
                                      text: employee.part!.partName.toString(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 15,),
                                    AppText(text: 'Hình thức nhận lương'),
                                    SizedBox(height: 5,),
                                    AppText(
                                      text: employee.salaryType.toString(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    SizedBox(height: 15,),
                                    AppText(text: 'Mức lương chính thức'),
                                    SizedBox(height: 5,),
                                    employeeVM.checkSaralyType(employee.salaryType.toString()) ?
                                    AppText( fontWeight: FontWeight.bold,
                                        text: '${employeeVM.formatSalary(employee.salaries.toString())} / tháng')
                                        : AppText( fontWeight: FontWeight.bold,
                                        text: '${employeeVM.formatSalary(employee.salaries.toString())} / giờ'),
                                    SizedBox(height: 15,),
                                    AppText(text: 'Địa chỉ làm việc'),
                                    SizedBox(height: 5,),
                                    AppText(
                                      text: "${employee.store!.chiTiet.toString()}, "
                                          "${employee.store!.xa.toString()},"
                                          "${employee.store!.huyen.toString()},"
                                          "${employee.store!.thanhPho.toString()}",
                                      fontWeight: FontWeight.bold,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 15,),
                                    AppText(text: 'Số liên hệ'),
                                    SizedBox(height: 5,),
                                    AppText(
                                      text: "${employee.store!.soDienThoai.toString()}",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                  ],
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1,10),
                              color: Colors.black.withOpacity(0.2),
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonButtom(
                              buttonColor: Colors.black26,
                              width: 185,
                              title: "Hủy",
                              onPress: (){
                                employeeVM.status.value = false;
                                employeeVM.replyUser();
                                Get.back();
                              }),
                          ButtonButtom(
                              buttonColor: Colors.green,
                              width: 185,
                              title: "Chấp nhận",
                              onPress: (){
                                employeeVM.status.value = true;
                                employeeVM.replyUser();
                              })
                        ],
                      ),
                    )
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Column(
              children: [
                // Widget cho màn hình không chờ...
              ],
            ),
          );
        }
      },
    );
  }
}

