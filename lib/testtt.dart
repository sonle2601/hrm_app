import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedValue = 'Music';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Dropdown Example'),
        ),
        body: Center(
          child: CustomDropDown(
            value: selectedValue,
            itemsList: ['Music', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer', 'Photographer'],
            dropdownColor: Colors.grey[200]!,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  final String value;
  final List<String> itemsList;
  final Color dropdownColor;
  final Function(String) onChanged;

  const CustomDropDown({
    required this.value,
    required this.itemsList,
    required this.dropdownColor,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: DropdownButton<String>(
              // isExpanded: true,
              // isDense: true, // Set isDense to true
              itemHeight: 48, // Set a smaller itemHeight value
              dropdownColor: dropdownColor,
              value: value,
              items: itemsList.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (newValue) {
                onChanged(newValue!);
              },
            ),

          ),
        ),
      ),
    );
  }
}
