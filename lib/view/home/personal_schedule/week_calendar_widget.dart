import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routes/route_name.dart';
import '../../../view_models/work_schedule_view_model.dart';

class WeekCalendarWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected; // Callback function để trả về ngày được chọn

  const WeekCalendarWidget({Key? key, required this.onDateSelected}) : super(key: key);

  @override
  State<WeekCalendarWidget> createState() => _WeekCalendarWidgetState();
}

class _WeekCalendarWidgetState extends State<WeekCalendarWidget> {
  late DateTime _startOfWeek;
  late DateTime _endOfWeek;
  int _selectedDayIndex = DateTime.now().weekday - 1;
  List<String> _weekDays = ['Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7', 'Chủ nhật'];

  @override
  void initState() {
    super.initState();
    _calculateWeekRange();
  }

  void _calculateWeekRange() {
    DateTime now = DateTime.now();
    _startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    _endOfWeek = _startOfWeek.add(Duration(days: 6));
  }

  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(Duration(days: 7));
      _endOfWeek = _endOfWeek.subtract(Duration(days: 7));
    });
  }

  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(Duration(days: 7));
      _endOfWeek = _endOfWeek.add(Duration(days: 7));
    });
  }

  DateTime getSelectedDate(int selectedDayIndex) {
    return _startOfWeek.add(Duration(days: selectedDayIndex));
  }

  @override
  Widget build(BuildContext context) {
    String formattedStartOfWeek = DateFormat('dd/MM/yyyy').format(_startOfWeek);
    String formattedEndOfWeek = DateFormat('dd/MM/yyyy').format(_endOfWeek);
    final WorkScheduleViewModel workScheduleVM = Get.put(WorkScheduleViewModel());
    String day = DateFormat('yyyy-MM-dd').format(_startOfWeek);
    workScheduleVM.getPersonalWorkSchedule(day);

    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, size: 16),
                  onPressed: _previousWeek,
                ),
              ),
              SizedBox(width: 20),
              Text(
                'Tuần : $formattedStartOfWeek - $formattedEndOfWeek',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(width: 20),
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios, size: 16),
                  onPressed: _nextWeek,
                ),
              ),
            ],
          ),
        ),
        Obx(() {
          if(workScheduleVM.loadData.isTrue){
            return Expanded(
              child: ListView.builder(
                itemCount: 7,
                itemBuilder: (BuildContext context, index) {
                  String day = DateFormat('yyyy-MM-dd').format(_startOfWeek.add(Duration(days: index))).toString();
                  return IntrinsicHeight(
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 10, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  '${_weekDays[index]}, ${DateFormat('dd/MM/yyyy').format(_startOfWeek.add(Duration(days: index)))}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: List.generate(workScheduleVM.personalWorkSchedule.length, (index) {
                                      var workSchedule = workScheduleVM.personalWorkSchedule[index];
                                      if(workSchedule.date == day){
                                        return GestureDetector(
                                          onTap: (){
                                            Get.toNamed(RouteName.detailScheduleScreen, arguments:workSchedule);
                                          },
                                          child: Container(
                                            height: 80,
                                            width: 160,
                                            margin: EdgeInsets.only(top: 10, right: 10),
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.black12,
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${workSchedule.workShift!.name} [${workSchedule.workShift!.startTime!.substring(0, 5)} - ${workSchedule.workShift!.endTime!.substring(0, 5)}]',
                                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                                ),
                                                SizedBox(height: 5),
                                                // Text(workSchedule.status, style: TextStyle(fontSize: 14)),
                                              ],
                                            ),
                                          ),
                                        );
                                      }else{
                                        return SizedBox();
                                      }
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                },
              ),
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
              );
          }
        })

      ],
    );
  }
}
