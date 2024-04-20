
class AppUrl{
  static const String baseUrl = "http://192.168.1.16:8001/api";

  static const String login = "$baseUrl/login";

  static const String register = "$baseUrl/register";

  static const String infomation = "$baseUrl/information";

  static const String infomationPersonal = "$baseUrl/information-personal";


  static const String checkInfor = "$baseUrl/check-information";

  static const String getUser = "http://192.168.1.6:8001/api/users";

  static const String baseUlrLocation = "https://vapi.vnappmob.com/api";

  static const String getProvinces = "$baseUlrLocation/province";

  static String getDistricts(String provinceId) => "$baseUlrLocation/province/district/$provinceId";

  static String getWards(String districtId)=> "$baseUlrLocation/province/ward/$districtId";
  static String  invite = '$baseUrl/employee_invite';

  static String  replyUser = '$baseUrl/employee_reply';

  static String  checkEmployee = '$baseUrl/employee_check';

  static String  employeeInfo = '$baseUrl/employee-info';


  static String workSchedule( String date) => '$baseUrl/common_work_schedule/$date';

  static String workScheduleAdd = '$baseUrl/work_schedule';

  static String  workShift = '$baseUrl/common-work-shift';

  static String personalWorkSchedule( String date) => '$baseUrl/personal_work_schedule/$date';

  static String attendance = '$baseUrl/attendance';

  static String attendancePersonal = '$baseUrl/attendance-personal';


  static String employeeAvailable(String work_shift_id, String date) => '$baseUrl/available_employees/$work_shift_id/$date';

  static String leaveRequets = '$baseUrl/leave-request';

  static String showReaveRequets(String workShiftId) => '$baseUrl/leave-request/$workShiftId';

  static String deleteLeaveRequets(String id) => '$baseUrl/leave-request/$id';



  static String lateEarlyRequets = '$baseUrl/late-early-request';

  static String  salaryPersonal(String startDate,String endDate) => '$baseUrl/salary-personal/$startDate/$endDate';

  static String  exitRequest  = '$baseUrl/exit-request';

  static String  showExitRequest(String workScheduleId)  => '$baseUrl/exit-request/$workScheduleId';

  static String deleteExitRequest(String id) => '$baseUrl/exit-request/$id';

  static String  showLateRequest(String workScheduleId)  => '$baseUrl/late-request/$workScheduleId';

  static String  showEarlyRequest(String workScheduleId)  => '$baseUrl/early-request/$workScheduleId';

  static String lateRequest = '$baseUrl/late-request';

  static String earlyRequest = '$baseUrl/early-request';

  static String deleteLateEarlyRequest(String id) => '$baseUrl/late-early-request/$id';

  static String attendanceRequest = '$baseUrl/attendance-request';

  static String  showAttendanceRequest(String workScheduleId)  => '$baseUrl/attendance-request/$workScheduleId';

  static String deleteAttendanceRequest(String id) => '$baseUrl/attendance-request/$id';

  static String changePassword = '$baseUrl/change-password';

  static String notification = '$baseUrl/notification';



}