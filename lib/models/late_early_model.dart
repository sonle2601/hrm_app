class LateEarlyModel {
  int? id;
  int? workScheduleId;
  String? type;
  String? status;
  String? reason;
  String? time;
  int? storeId;
  String? createdAt;

  LateEarlyModel(
      {this.id,
        this.workScheduleId,
        this.type,
        this.status,
        this.reason,
        this.time,
        this.storeId,
        this.createdAt});

  LateEarlyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workScheduleId = json['work_schedule_id'];
    type = json['type'];
    status = json['status'];
    reason = json['reason'];
    time = json['time'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['work_schedule_id'] = this.workScheduleId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['reason'] = this.reason;
    data['time'] = this.time;
    data['store_id'] = this.storeId;
    data['created_at'] = this.createdAt;
    return data;
  }
}