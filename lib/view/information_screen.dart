import 'package:employee_manager/repository/auth_repository.dart';
import 'package:employee_manager/utils/utils.dart';
import 'package:employee_manager/validation.dart';
import 'package:employee_manager/widgets/can_cuoc_input.dart';
import 'package:employee_manager/utils/dimensions.dart';
import 'package:employee_manager/widgets/app_text_field.dart';
import 'package:employee_manager/widgets/big_text.dart';
import 'package:employee_manager/widgets/birthday_input.dart';
import 'package:employee_manager/widgets/gender_selection.dart';
import 'package:employee_manager/widgets/image_icon.dart';
import 'package:employee_manager/widgets/location_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route_name.dart';
import '../view_models/information_view_model.dart';
import '../widgets/bank_selection.dart';
import '../widgets/round_button.dart';

class InformationScreen extends StatelessWidget {
  const InformationScreen({super.key});




  @override
  Widget build(BuildContext context) {
    final inforVM = Get.put(InformationViewModel());
    //
    //
    // AuthRepository authRepository = AuthRepository();
    //
    // TextEditingController emailController = TextEditingController();
    // TextEditingController nameController = TextEditingController();
    // TextEditingController idNumberController = TextEditingController();
    // TextEditingController phoneNumberController = TextEditingController();
    // TextEditingController birthdayController = TextEditingController();
    // TextEditingController aptNumberController  = TextEditingController();
    // TextEditingController accNumberController  = TextEditingController();
    // String? selectedGender;
    // String? selectedCity, selectedDistrict, selectedWard;
    // String? selectedBank;
    // String? frontImageUrl;
    // String? backImageUrl;



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
            AppTextField(textEditingController: inforVM.email.value,
                hintText: "Email",
                icon:  Icons.email,
                title: "Email",
                message: "Email Enter"),
            SizedBox(height: 15,),
            AppTextField(textEditingController: inforVM.name.value,
                hintText: "Họ Tên",
                icon:  Icons.person,
                title: "Họ Tên",
                message: "Họ Tên Enter"),
            SizedBox(height: 15,),
            AppTextField(textEditingController: inforVM.idNumber.value,
                keyboardType: TextInputType.number,
                hintText: "Số căn cước",
                icon:  Icons.numbers,
                title: "Số căn cước",
                message: "Số căn cước Enter"),
            SizedBox(height: 15,),
            AppTextField(textEditingController: inforVM.phoneNumber.value,
                keyboardType: TextInputType.number,
                hintText: "Số điện thoại",
                icon:  Icons.phone_android,
                title: "Số điện thoại",
                message: "Số điện thoại"),
            SizedBox(height: 15,),
            BirthdayInput(birthdayController: inforVM.birthday.value,),
            GenderSelection(
              onGenderSelected: (String? gender) {
                inforVM.selectedGender = gender;
              },
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
            Container(
              height: 320, // hoặc bất kỳ giá trị nào phù hợp
              child: LocationWidget(
                aptNumberController: inforVM.aptNumber.value,
                onLocationSelected: (String? cityName, String? districtName, String? wardName) {
                  // Kiểm tra và lưu trữ giá trị null khi chưa được chọn
                  inforVM.selectedCity = cityName ?? '';
                  inforVM.selectedDistrict = districtName ?? '';
                  inforVM.selectedWard = wardName ?? '';
                },
              ),

            ),


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
            BankSelection(
              accNumberController: inforVM.accNumber.value,
              onBankSelected: (String? selectionBank) {
                inforVM.selectedBank = selectionBank;
              },
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
                inforVM.birthday.value.text,
                inforVM.selectedGender.toString(),
                inforVM.selectedCity.toString(),
                inforVM.selectedDistrict.toString(),
                inforVM.selectedWard.toString(),
                inforVM.aptNumber.value.text,
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
