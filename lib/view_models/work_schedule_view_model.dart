import 'package:get/get.dart';
import 'package:intl/intl.dart';


import '../../utils/utils.dart';
import '../models/work_schedule_model.dart';
import '../repository/work_schedule_repository.dart';

class WorkScheduleViewModel extends GetxController{
   String? date = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final _api = WorkScheduleRepository();
  var workSchedule = <WorkScheduleModel>[].obs;
   var personalWorkSchedule = <WorkScheduleModel>[].obs;


  String? dateAdd;
  int? idWorkShifts;
  List<int>? idEmployee;

  @override
  void onInit() {
    super.onInit();
  }

  RxBool loadData = false.obs;

  Future<void> getworkSchedule() async {
    try {
      loadData.value = false;
      List<WorkScheduleModel> workScheduleModel = await _api.getWorkSchedule(date.toString());
      workSchedule.assignAll(workScheduleModel);
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }

   Future<void> getPersonalWorkSchedule(String day) async {
     try {
       loadData.value = false;
       List<WorkScheduleModel> workScheduleModel = await _api.getPersonalWorkSchedule(day.toString());
       personalWorkSchedule.assignAll(workScheduleModel);
       loadData.value = true;
     } catch (error) {
       print(error.toString());
       Utils.snackBar("Lỗi", error.toString());
     }
   }

}