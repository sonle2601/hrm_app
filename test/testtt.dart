import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WorkScheduleScreen(),
    );
  }
}

class WorkScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Schedule'),
      ),
      body: WorkSchedule(),
    );
  }
}

class WorkSchedule extends StatefulWidget {
  @override
  _WorkScheduleState createState() => _WorkScheduleState();
}

class _WorkScheduleState extends State<WorkSchedule> {
  List<String> employees = ['Employee 1', 'Employee 2', 'Employee 3'];
  List<String> tasks = ['Preparation', 'Dishwashing', 'Cleaning'];
  int numberOfEmployees = 9;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Text('Work Schedule for the Week'),
          SizedBox(height: 10),
          for (int i = 0; i < 7; i++)
            ListTile(
              title: Text('Day ${i + 1}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (int j = 0; j < employees.length; j++)
                    Text('${employees[j]}: ${tasks[j % tasks.length]}'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
