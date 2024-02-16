import 'package:get/get.dart';
import '../models/work_shift_model.dart';
import '../repository/work_shift_repository.dart';
import '../utils/utils.dart';

class WorkShiftViewModel extends GetxController{
  final _api = WorkShiftRepository();

  var workShifts = <WorkShiftModel>[].obs;
  RxBool isUpdating = false.obs;
  RxBool switchValue = false.obs;
  RxBool loading = false.obs;
  String textStatus = "Đang hoạt động";
  int? idWorkShift ;





  @override
  void onInit() {
    getWorkShift();
    super.onInit();
  }

  RxBool loadData = false.obs;



  Future<void> getWorkShift() async {
    try {
      loadData.value = false;
      List<WorkShiftModel> workShiftsModel = await _api.getWorkShift();
      workShifts.assignAll(workShiftsModel);
      loadData.value = true;
    } catch (error) {
      print(error.toString());
      Utils.snackBar("Lỗi", error.toString());
    }
  }

}