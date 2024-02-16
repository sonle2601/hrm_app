import 'package:employee_manager/utils/utils.dart';
import 'package:employee_manager/view_models/information_view_model.dart';
import 'package:employee_manager/widgets/app_text_area.dart';
import 'package:employee_manager/widgets/button_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_text.dart';

class PasswordChangeScreen extends StatelessWidget {
  const PasswordChangeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final inforVM = Get.put(InformationViewModel());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Đổi mật khẩu",
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            AppTextArea(
                hintText: "Mật khẩu cũ",
              textEditingController: inforVM.passwordController.value,
            ),
            SizedBox(height: 20,),
            AppTextArea(
                hintText: "Mật mới",
              textEditingController: inforVM.newPasswordController.value,

            ),
            SizedBox(height: 20,),
            AppTextArea(
                hintText: "Mật xác nhận mật khẩu",
              textEditingController: inforVM.confirmPasswordController.value,

            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(10),
              child: ButtonButtom(
                  width: MediaQuery.of(context).size.width,
                  title: "Đồng ý",
                  onPress: (){
                    String? error = inforVM.validatePassword();
                    if(error != null){
                      Utils.snackBar("Lỗi", error.toString());
                    }else{
                      inforVM.changePassword();
                      Get.back();
                    }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
