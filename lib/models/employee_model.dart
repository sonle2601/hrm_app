import 'package:employee_manager/models/parts_model.dart';
import 'package:employee_manager/models/store_model.dart';
import 'package:employee_manager/models/user_model.dart';

import 'information_model.dart';

class EmployeeModel {
  int? id;
  int? partId;
  int? storeId;
  int? userId;
  String? employeeName;
  String? employeePhone;
  String? employeeEmail;
  String? salaryType;
  String? salaries;
  String? startTime;
  int? employeeStatus;
  String? invitationStatus;
  StoreModel? store;
  PartsModel? part;
  UserModel? user;
  InformationModel? information;


  EmployeeModel(
      {this.id,
        this.partId,
        this.storeId,
        this.userId,
        this.employeeName,
        this.employeePhone,
        this.employeeEmail,
        this.salaryType,
        this.salaries,
        this.startTime,
        this.employeeStatus,
        this.invitationStatus,
        this.store,
        this.part,
        this.user,
        this.information
      });

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    partId = json['part_id'];
    storeId = json['store_id'];
    userId = json['user_id'];
    employeeName = json['employee_name'];
    employeePhone = json['employee_phone'];
    employeeEmail = json['employee_email'];
    salaryType = json['salary_type'];
    salaries = json['salaries'];
    startTime = json['start_time'];
    employeeStatus = json['employee_status'];
    invitationStatus = json['invitation_status'];
    store = json['store'] != null ? new StoreModel.fromJson(json['store']) : null;
    part = json['part'] != null ? new PartsModel.fromJson(json['part']) : null;
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    information = json['information'] != null ? new InformationModel.fromJson(json['information']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['part_id'] = this.partId;
    data['store_id'] = this.storeId;
    data['user_id'] = this.userId;
    data['employee_name'] = this.employeeName;
    data['employee_phone'] = this.employeePhone;
    data['employee_email'] = this.employeeEmail;
    data['salary_type'] = this.salaryType;
    data['salaries'] = this.salaries;
    data['start_time'] = this.startTime;
    data['employee_status'] = this.employeeStatus;
    data['invitation_status'] = this.invitationStatus;
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
    if (this.part != null) {
      data['part'] = this.part!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.information != null) {
      data['information'] = this.information!.toJson();
    }
    return data;
  }
}

