import 'package:employee_manager/models/work_schedule_model.dart';

class AttendanceModel {

  String? checkIn;
  String? checkOut;
  int? minutesOut;
  String? nameDevice;
  String? macAddress;
  String? status;
  String? date;
  int? totalMinutes;
  String? updatedAt;
  String? createdAt;
  int? id;
  int? workScheduleId;
  WorkScheduleModel? workSchedule;


  AttendanceModel(
      {this.checkIn,
        this.checkOut,
        this.minutesOut,
        this.workSchedule,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.date,
        this.macAddress,
        this.nameDevice,
        this.totalMinutes,
        this.workScheduleId
      });

  AttendanceModel.fromJson(Map<String, dynamic> json) {
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    minutesOut = json['minutes_out'];
    date = json['date'];
    workSchedule = json['work_schedule'] != null
        ? new WorkScheduleModel.fromJson(json['work_schedule'])
        : null;
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    totalMinutes = json['total_minutes'];
    workScheduleId = json['work_schedule_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['check_in'] = this.checkIn;
    data['check_out'] = this.checkOut;
    data['minutes_out'] = this.minutesOut;
    data['work_schedule'] = this.workSchedule;
    data['mac_address'] = this.macAddress;
    data['name_device'] = this.nameDevice;
    data['status'] = this.status;
    data['total_minutes'] = this.totalMinutes;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['work_schedule_id'] = this.workScheduleId;
    data['id'] = this.id;
    if (this.workSchedule != null) {
      data['work_schedule'] = this.workSchedule!.toJson();
    }
    return data;
  }
}
