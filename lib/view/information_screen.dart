import 'package:employee_manager/widgets/app_text_area.dart';
import 'package:employee_manager/widgets/select_item/select_bank.dart';
import 'package:employee_manager/widgets/select_item/select_gender.dart';
import 'package:employee_manager/widgets/select_item/title_icon_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import '../view_models/information_view_model.dart';
import '../widgets/app_text.dart';
import '../widgets/app_text_field.dart';
import '../widgets/big_text.dart';
import '../widgets/can_cuoc_input.dart';
import '../widgets/gender_selection.dart';
import '../widgets/image_icon.dart';
import '../widgets/location_widget.dart';
import '../widgets/round_button.dart';
import '../widgets/select_item/select_address.dart';
import '../widgets/select_item/select_day.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  final inforVM = Get.put(InformationViewModel());
  String selectedDateTime = "Chọn ngày sinh";
  String selectedGender = "Chọn giới tính";
  String selectedBank = "Chọn ngân hàng";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Center(child: BigText(text: "Hãy hoàn thiện hồ sơ", size: 25,color: Colors.black,)),
            SizedBox(height: 10,),
            Container(
              height: 60,
              width: 400,
              margin: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.lightBlueAccent
              ),
              child: Center(
                child: Text("Vui lòng hoàn thiện hồ sơ với đầy đủ thông tin cá nhân \n trước khi bắt đầu công việc",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 14
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 30,),
            ImageIcons(height: 70, width: 70, image: 'assets/images/add_photo.png',),
            SizedBox(height: 20,),
            AppTextArea(
              hintText: 'Email',
              textEditingController: inforVM.email.value,
            icon: Icon(Icons.email),
            ),
            SizedBox(height: 15,),
            AppTextArea(
              hintText: 'Họ tên',
              textEditingController: inforVM.name.value,
              icon: Icon(Icons.person),
            ),
            SizedBox(height: 15,),
            AppTextArea(hintText: 'Số căn cước',
              keyboardType: TextInputType.number,
              textEditingController: inforVM.idNumber.value,
              icon: Icon(Icons.numbers),
            ),
            SizedBox(height: 15,),
            AppTextArea(hintText: 'Số điện thoại',
              keyboardType: TextInputType.number,
              textEditingController: inforVM.phoneNumber.value,
              icon: Icon(Icons.phone_android),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                SelectDay.selectDate(context, (dateTime) {
                  setState(() {
                    selectedDateTime = dateTime.toString();
                    inforVM.birthday = dateTime.toString();
                  });
                },
                );
              },
              child: TitleIconSelect(
                name: selectedDateTime,
                  title: 'Ngày sinh',
                  icon: Icons.calendar_today
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                SelectGender.showSelectGender(context, (gender) {
                  setState(() {
                    selectedGender = gender.toString();
                    inforVM.selectedGender = gender.toString();
                  });
                },
                );
              },
              child: TitleIconSelect(
                  name: selectedGender,
                  title: 'Giới tính',
                  icon: Icons.person),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.only(left: 25), // hoặc bất kỳ giá trị nào phù hợp
              alignment: Alignment.centerLeft,
              child: Text(
                "Chỗ ở hiện tại",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10,),
            SelectAddress(onLocationSelected: (onLocationSelected){
              setState(() {
                inforVM.selectedAddress = onLocationSelected.toString();
              });
            }),

            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 25), // hoặc bất kỳ giá trị nào phù hợp
              alignment: Alignment.centerLeft,
              child: Text(
                "Tài khoản ngân hàng",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                SelectBank.showSelectBank(context, (bank) {
                  setState(() {
                    selectedBank = bank.toString();
                    inforVM.selectedBank = bank.toString();
                  });
                },
                );
              },
              child: TitleIconSelect(
                name: selectedBank,
                  title: 'Ngân hàng',
                  icon: Icons.account_balance),

            ),
            SizedBox(height: 20,),
            AppTextArea(hintText: 'Số tài khoản',
                keyboardType: TextInputType.number,
                textEditingController: inforVM.accNumber.value,
                icon: Icon(Icons.numbers)
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.only(left: 25), // hoặc bất kỳ giá trị nào phù hợp
              alignment: Alignment.centerLeft,
              child: Text(
                "Ảnh chứng minh nhân dân 2 mặt",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 10,),
            AnhCanCuoc(
              text:  "Ảnh chứng minh nhân dân\n(mặt trước)",
              onImageSelected: (String imageUrl) {
                inforVM.frontImageUrl = imageUrl;
              },
            ),
            AnhCanCuoc(
              text:  "Ảnh chứng minh nhân dân\n(mặt sau)",
              onImageSelected: (String imageUrl) {
                inforVM.backImageUrl = imageUrl;
              },
            ),
            SizedBox(height: 20,),
            Obx(() => RoundButton(
                width: 350,
                title: 'Xác nhận',
                loading: inforVM.loading.value,
                onPress: (){
                  // print("hello"+inforVM.backImageUrl.toString());
                  String? validationError = inforVM.validateInformation(
                    inforVM.email.value.text,
                    inforVM.name.value.text,
                    inforVM.idNumber.value.text,
                    inforVM.phoneNumber.value.text,
                    inforVM.birthday.toString(),
                    inforVM.selectedGender.toString(),
                    inforVM.selectedAddress.toString(),
                    inforVM.frontImageUrl.toString(),
                    inforVM.backImageUrl.toString(),
                  );
                  if (validationError != null) {
                    Utils.snackBar("Lỗi", validationError.toString());
                  } else {
                    inforVM.informationApi();
                  }
                }
            ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  }
}
