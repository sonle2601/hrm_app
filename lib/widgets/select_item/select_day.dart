import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDay {
  static void selectDate(BuildContext context, Function(String dateTime) onSelect) {
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context); // Close bottom sheet on cancel
                        },
                        child: Text(
                          'Hủy',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          onSelect(formatDate(selectedDate));
                          Navigator.pop(context); // Close bottom sheet on select
                        },
                        child: Text(
                          'Chọn',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20), // Spacing between elements
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                      mode: CupertinoDatePickerMode.date,
                      initialDateTime: selectedDate,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setModalState(() {
                          selectedDate = newDateTime;
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

String formatDate(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
}
