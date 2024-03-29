
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'colors.dart';

class Utils{
  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColor.backColor,
      textColor: AppColor.whiteColor,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static toastMessageCenter(String message){
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColor.backColor,
      gravity: ToastGravity.CENTER,
      textColor: AppColor.whiteColor,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
      title,
      message
    );
  }
}