import 'package:employee_manager/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';
import '../../view_models/employee_view_model.dart';
import 'image_content_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final employeeVM = Get.put(EmployeeViewModel());
    employeeVM.getEmployeeInfo();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 45, left: 25, right: 25),
        child: Obx(() {
          final employee = employeeVM.employeeInfo.value;
          if (employeeVM.loadData.value) {
            return Column(
              children: [
                ImageContentWidget(
                  onTap: () {
                    employeeVM.inforEmployee(employee);
                  },
                  image: 'assets/images/user.png',
                  title: employee.information!.hoTen.toString(),
                  description: 'Chỉnh sửa thông tin cá nhân',
                ),
                SizedBox(height: 10,),
                ImageContentWidget(
                  onTap: (){
                    Get.toNamed(RouteName.passwordChangeScreen);
                  },
                  image: 'assets/images/padlock.png',
                  title: "Bảo mật",
                  description: 'Đổi mật khẩu',
                ),
                SizedBox(height: 10,),
                ImageContentWidget(
                  image: 'assets/images/logout.png',
                  title: "Đăng xuất",
                  description: 'Đăng xuất khỏi hệ thống',
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
