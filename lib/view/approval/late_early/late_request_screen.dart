import 'package:employee_manager/utils/format_util.dart';
import 'package:employee_manager/view_models/requests/late_request_view_model.dart';
import 'package:employee_manager/view_models/requests/leave_request_view_model.dart';
import 'package:employee_manager/widgets/select_item/select_time.dart';
import 'package:employee_manager/widgets/select_item/title_icon_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/work_schedule_model.dart';
import '../../../utils/utils.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/app_text_area.dart';

class LateRequestScreen extends StatefulWidget {
  const LateRequestScreen({super.key});

  @override
  State<LateRequestScreen> createState() => _LateRequestScreenScreenState();
}

class _LateRequestScreenScreenState extends State<LateRequestScreen> {
  final WorkScheduleModel workSchedule = Get.arguments as WorkScheduleModel;
  final lateRequestVM = Get.put(LateRequestViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Xin đi muộn",
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
          GestureDetector(
              onTap: (){
                if(lateRequestVM.enableReason){
                  SelectTime.selectTime(context, (hour, minute){
                    setState(() {
                      // lateRequestVM.time.toString() = '$hour:$minute';
                      lateRequestVM.time = '$hour:$minute';
                    });
                  });
                }
              },
              child: TitleIconSelect(
                  title: "Thời gian",
                  icon: Icons.access_time,
                  name: FormatUtils.convertTime(lateRequestVM.time.toString()))
          ),
          SizedBox(height: 15,),
          AppTextArea(
            enable: lateRequestVM.enableReason,
            maxLines: 3,
            hintText: 'Lý do',
            textEditingController: lateRequestVM.reasonController.value,
          ),
          SizedBox(height: 15,),
        ],
      ),
        bottomNavigationBar: BottomAppBar(
            child: lateRequestVM.statusButton == 'approved' ?
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
            lateRequestVM.statusButton == 'rejected' ?
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
            lateRequestVM.statusButton == 'pending' ?
            GestureDetector(
              onTap: () {
                lateRequestVM.deleteLateRequest(lateRequestVM.late.value.id.toString());
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
                String? error = lateRequestVM.validate(workSchedule);
                if(error != null){
                  Utils.snackBarError("Lỗi", error);
                }else{
                  lateRequestVM.addLateRequest();
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
                  text:  "Xin đi muộn",
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
        )


    );
  }
}
