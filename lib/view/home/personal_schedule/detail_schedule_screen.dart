import 'package:employee_manager/view_models/requests/attendance_request_view_model.dart';
import 'package:employee_manager/view_models/requests/early_request_view_model.dart';
import 'package:employee_manager/view_models/requests/exit_request_view_model.dart';
import 'package:employee_manager/view_models/requests/late_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/work_schedule_model.dart';
import '../../../utils/format_util.dart';
import '../../../view_models/employee_view_model.dart';
import '../../../view_models/requests/leave_request_view_model.dart';
import '../../../widgets/app_text.dart';
import '../../approval/shift_leave/title_text_widget.dart';
import 'personal_shcedule_task.dart';

class DetailScheduleScreen extends StatefulWidget {
  const DetailScheduleScreen({super.key});

  @override
  State<DetailScheduleScreen> createState() => _DetailScheduleScreenState();
}

class _DetailScheduleScreenState extends State<DetailScheduleScreen> {
  final WorkScheduleModel workSchedule = Get.arguments as WorkScheduleModel;
  final employeeVM = Get.put(EmployeeViewModel());
  final leaveRequestVM = Get.put(LeaveRequestViewModel());
  final exitRequestVM = Get.put(ExitRequestViewModel());
  final lateRequestVM = Get.put(LateRequestViewModel());
  final earlyRequestVM = Get.put(EarlyRequestViewModel());
  final attendanceRequestVM = Get.put(AttendanceRequestViewModel());




  @override
  void initState() {
    leaveRequestVM.workScheduleId = workSchedule.id;
    exitRequestVM.workScheduleId = workSchedule.id;
    lateRequestVM.workScheduleId = workSchedule.id;
    earlyRequestVM.workScheduleId = workSchedule.id;
    attendanceRequestVM.workScheduleId = workSchedule.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AppText(
          text: "Chi tiết lịch ",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 10, left: 10, top: 10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  TitleTextWidget(title: 'Ngày', text: '${workSchedule.date.toString()}'),
                  TitleTextWidget(title: 'Tên ca', text: '${workSchedule.workShift!.name}'),
                  TitleTextWidget(title: 'Thời gian', text: '${FormatUtils.convertTime(workSchedule.workShift!.startTime.toString())} đến ${FormatUtils.convertTime(workSchedule.workShift!.endTime.toString())}'),
                ],
              ),
            ),
            Container(
              height: 340,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Column(
                children: [
                  PersonalScheduleTask(
                    onTap: () {
                      leaveRequestVM.leaveRequest(workSchedule);
                    },
                    image: 'assets/images/comfort.png',
                    title: 'Xin nghỉ ca',
                  ),
                  PersonalScheduleTask(
                    onTap: () {
                      lateRequestVM.lateRequest(workSchedule);
                    },
                    image: 'assets/images/di_muon.png',
                    title: 'Xin đi muộn',
                  ),
                  PersonalScheduleTask(
                    onTap: () {
                      earlyRequestVM.earlyRequest(workSchedule);
                    },
                    image: 'assets/images/soon.png',
                    title: 'Xin về sớm',
                  ),
                  PersonalScheduleTask(
                    onTap: () {
                      exitRequestVM.exitRequest(workSchedule);
                    },
                    image: 'assets/images/ra_ngoai.png',
                    title: 'Xin ra ngoài',
                  ),
                  PersonalScheduleTask(
                    onTap: () {
                      attendanceRequestVM.attendanceRequest(workSchedule);
                    },
                    image: 'assets/images/addition.png',
                    title: 'Chấm công bổ sung',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
