import 'dart:developer';

import 'package:employee_manager/view_models/requests/leave_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/work_schedule_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_area.dart';
import '../../../widgets/select_item/select_employee.dart';
import '../../../widgets/select_item/title_icon_select.dart';

class ShiftLeaveRequestScreen extends StatefulWidget {
  const ShiftLeaveRequestScreen({Key? key});

  @override
  State<ShiftLeaveRequestScreen> createState() => _ShiftLeaveRequestScreenState();
}

class _ShiftLeaveRequestScreenState extends State<ShiftLeaveRequestScreen> {
  final WorkScheduleModel workSchedule = Get.arguments as WorkScheduleModel;
  final leaveRequestVM = Get.put(LeaveRequestViewModel());

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
          text: "Xin nghỉ ca ",
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
            textEditingController: leaveRequestVM.reasonController.value,
            enable: leaveRequestVM.enableReason,
          ),
          SizedBox(height: 15,),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          child: leaveRequestVM.statusButton == 'accept' ?
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
          leaveRequestVM.statusButton == 'refuse' ?
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
              leaveRequestVM.statusButton == 'waiting' ?
          GestureDetector(
            onTap: () {
              leaveRequestVM.deleteLeaveRequest(leaveRequestVM.leave.value.id.toString());
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
              leaveRequestVM.addLeaveRequest();
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
                text:  "Đăng kí nghỉ",
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
