import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Work Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskAssignmentScreen(),
    );
  }
}

class TaskAssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Work Assignment'),
      ),
      body: TaskAssignmentWidget(),
    );
  }
}

class TaskAssignmentWidget extends StatefulWidget {
  @override
  _TaskAssignmentWidgetState createState() => _TaskAssignmentWidgetState();
}

class _TaskAssignmentWidgetState extends State<TaskAssignmentWidget> {
  List<String> employees = [
    'Employee 1',
    'Employee 2',
    'Employee 3',
    'Employee 4',
    'Employee 5',
  ];

  List<String> tasks = ['Làm than', 'Làm vỉ', 'Làm trong'];

  Map<String, Map<String, String>> weekTaskAssignment = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < 7; i++)
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Day ${i + 1}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              String task = tasks[index];
              return ListTile(
                title: Text(task),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < 7; i++)
                      DropdownButton<String>(
                        value: weekTaskAssignment['Day ${i + 1}']?[task],
                        onChanged: (newValue) {
                          setState(() {
                            if (weekTaskAssignment['Day ${i + 1}'] == null) {
                              weekTaskAssignment['Day ${i + 1}'] = {};
                            }
                            weekTaskAssignment['Day ${i + 1}']![task] = newValue!;
                          });
                        },
                        items: employees.map<DropdownMenuItem<String>>((employee) {
                          return DropdownMenuItem<String>(
                            value: employee,
                            child: Text(employee),
                          );
                        }).toList(),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Handle saving the task assignments here
            print(weekTaskAssignment);
          },
          child: Text('Save Assignments'),
        ),
      ],
    );
  }
}
