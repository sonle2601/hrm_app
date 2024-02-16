
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Validation{
 static bool isNotEmpty(String value) {
    return value.isNotEmpty;
  }

 static bool isTime(String input) {
   if (input.contains(':')) {
     List<String> parts = input.split(':');
       String hour = parts[0];
       String minute = parts[1];
     int? hourInt = int.tryParse(hour);
     log(hourInt.toString());
     int? minuteInt = int.tryParse(minute);
     if (hourInt != null && minuteInt != null) {
         return true;
       }
   }
   log("message");
   return false;
 }


 static bool isWithinShift(String arrivalTime, String shiftStartTime, String shiftEndTime) {
   DateFormat dateFormat = DateFormat.Hm();
   DateTime arrivalDateTime = dateFormat.parse(arrivalTime);
   DateTime shiftStartDateTime = dateFormat.parse(shiftStartTime);
   DateTime shiftEndDateTime = dateFormat.parse(shiftEndTime);

   return (arrivalDateTime.isAtSameMomentAs(shiftStartDateTime) || arrivalDateTime.isAfter(shiftStartDateTime)) &&
       (arrivalDateTime.isAtSameMomentAs(shiftEndDateTime) || arrivalDateTime.isBefore(shiftEndDateTime));
 }


 static bool isMinutesInRange(String minutesStr, String startStr, String endStr) {
    TimeOfDay start = TimeOfDay.fromDateTime(DateTime.parse("1970-01-01 $startStr"));
    TimeOfDay end = TimeOfDay.fromDateTime(DateTime.parse("1970-01-01 $endStr"));
    int minutes = int.parse(minutesStr);
    int startMinutes = start.hour * 60 + start.minute;
    int endMinutes = end.hour * 60 + end.minute;
    if (endMinutes < startMinutes) {
      endMinutes += 24 * 60;
    }

    int difference = endMinutes - startMinutes;
    return minutes < difference;
  }




 static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

 static bool isValidIDNumber(String idNumber) {
    // Kiểm tra xem chuỗi chỉ chứa chữ số và có độ dài là 9
    return RegExp(r'^[0-9]{9,13}$').hasMatch(idNumber);
  }

// Hàm kiểm tra tính hợp lệ của số điện thoại
  static bool isValidPhoneNumber(String phoneNumber) {
    // Bạn có thể thực hiện các kiểm tra khác như độ dài, định dạng số, v.v.
    return phoneNumber.isNotEmpty;
  }

  static bool isValidBirthday(String birthday) {
    return birthday.isNotEmpty;
  }

  static bool isValidAptNumber(String aptNumber) {
    return true;
  }


  static bool isValidAccNumber(String accNumber) {
    // Bạn có thể thực hiện các kiểm tra khác nếu cần
    return true; // Đơn giản là trả về true trong ví dụ này
  }

}