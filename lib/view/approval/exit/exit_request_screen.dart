import 'dart:developer';

import 'package:employee_manager/view_models/requests/exit_request_view_model.dart';
import 'package:employee_manager/view_models/requests/leave_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/work_schedule_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_area.dart';
import '../../../widgets/select_item/select_employee.dart';
import '../../../widgets/select_item/title_icon_select.dart';

class ExitRequestScreen extends StatefulWidget {
  const ExitRequestScreen({Key? key});

  @override
  State<ExitRequestScreen> createState() => _ExitRequestScreenState();
}

class _ExitRequestScreenState extends State<ExitRequestScreen> {
  final WorkScheduleModel workSchedule = Get.arguments as WorkScheduleModel;
  final exitRequestVM = Get.put(ExitRequestViewModel());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Xin ra ngoài ",
          size: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            Get.back(result: workSchedule);
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
      body: Column(
        children: [
          SizedBox(height: 15,),
          AppTextArea(
            hintText: 'Ngày',
            textEditingController: TextEditingController(text: workSchedule.date),
            enable: false,
          ),
          SizedBox(height: 15,),
          AppTextArea(
            hintText: 'Ca làm việc',
            textEditingController: TextEditingController(
                text: '${workSchedule.workShift!.name} (${workSchedule.workShift!.startTime!.substring(0, 5)} - ${workSchedule.workShift!.endTime!.substring(0, 5)})'
            ),
            enable: false,
          ),
          SizedBox(height: 15,),
          AppTextArea(
            maxLines: 3,
            hintText: 'Lý do xin nghỉ',
            textEditingController: exitRequestVM.reasonController.value,
            enable: exitRequestVM.enableReason,
          ),
          SizedBox(height: 15,),
          AppTextArea(
            keyboardType: TextInputType.number,
            hintText: 'Thời gian ra ngoài (phút)',
            textEditingController: exitRequestVM.minutesOutController.value,
            enable: exitRequestVM.enableReason,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: exitRequestVM.statusButton == 'approved' ?
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      // Đặt các hành động cần thực hiện khi nút được nhấn ở trạng thái đã được chấp nhận
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: AppText(
                        size: 20,
                        text: "Yêu cầu của bạn đã được chấp nhận",
                        textAlign: TextAlign.center,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
              :
          exitRequestVM.statusButton == 'rejected' ?
          Container(
            height: 50,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: AppText(
              size: 20,
              text: "Yêu cầu của bạn bị từ chối",
              textAlign: TextAlign.center,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          )
              :
          exitRequestVM.statusButton == 'pending' ?
          GestureDetector(
            onTap: () {
              exitRequestVM.deleteExitRequest(exitRequestVM.exit.value.id.toString());
              Get.back(result: workSchedule);
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: AppText(
                size: 20,
                text:  "Hủy đăng ký",
                textAlign: TextAlign.center,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
              :
          GestureDetector(
            onTap: () {
              String? error = exitRequestVM.validate(workSchedule);
              if(error != null){
                Utils.snackBarError("Lỗi", error);
              }else{
                exitRequestVM.addExitRequest();
                Get.back(result: workSchedule);
              }
            },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: AppText(
                size: 20,
                text:  "Xin ra ngoài",
                textAlign: TextAlign.center,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ),
    );
  }
}
