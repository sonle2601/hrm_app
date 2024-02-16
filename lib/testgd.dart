import 'package:employee_manager/test1.dart';
import 'package:employee_manager/testgdapi.dart';
import 'package:employee_manager/widgets/location_widget.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String? _selectedProvince; // Sử dụng null làm giá trị mặc định
  String? _selectedDistrict;
  String? _selectedCommune;

  List<String> _provinces = ['Tỉnh 1', 'Tỉnh 2', 'Tỉnh 3']; // Danh sách tỉnh
  Map<String, List<String>> _districtsData = {
    'Tỉnh 1': ['Huyện 1', 'Huyện 2', 'Huyện 3'], // Danh sách huyện theo tỉnh
    'Tỉnh 2': ['Huyện 4', 'Huyện 5', 'Huyện 6'],
    'Tỉnh 3': ['Huyện 7', 'Huyện 8', 'Huyện 9'],
  };
  Map<String, List<String>> _communesData = {
    'Huyện 1': ['Xã 1', 'Xã 2', 'Xã 3'], // Danh sách xã theo huyện
    'Huyện 2': ['Xã 4', 'Xã 5', 'Xã 6'],
    'Huyện 3': ['Xã 7', 'Xã 8', 'Xã 9'],
    'Huyện 4': ['Xã 10', 'Xã 11', 'Xã 12'],
    'Huyện 5': ['Xã 13', 'Xã 14', 'Xã 15'],
    'Huyện 6': ['Xã 16', 'Xã 17', 'Xã 18'],
    'Huyện 7': ['Xã 19', 'Xã 20', 'Xã 21'],
    'Huyện 8': ['Xã 22', 'Xã 23', 'Xã 24'],
    'Huyện 9': ['Xã 25', 'Xã 26', 'Xã 27'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Địa chỉ'),
      ),
      body: Column(
        children: [
          DropdownButtonFormField<String>(
            value: _selectedProvince,
            hint: Text('Chọn Tỉnh/Thành phố'),
            items: _provinces.map((String province) {
              return DropdownMenuItem<String>(
                value: province,
                child: Text(province),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedProvince = value;
                _selectedDistrict = null; // Đặt giá trị null khi tỉnh thay đổi
                _selectedCommune = null; // Đặt giá trị null khi tỉnh thay đổi
              });
            },
          ),
          if (_selectedProvince != null)
            DropdownButtonFormField<String>(
              value: _selectedDistrict,
              hint: Text('Chọn Quận/Huyện'),
              items: _districtsData[_selectedProvince!]!.map((String district) {
                return DropdownMenuItem<String>(
                  value: district,
                  child: Text(district),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedDistrict = value;
                  _selectedCommune = null; // Đặt giá trị null khi huyện thay đổi
                });
              },
            ),
          if (_selectedDistrict != null)
            DropdownButtonFormField<String>(
              value: _selectedCommune,
              hint: Text('Chọn Xã/Phường'),
              items: _communesData[_selectedDistrict!]!.map((String commune) {
                return DropdownMenuItem<String>(
                  value: commune,
                  child: Text(commune),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCommune = value;
                });
              },
            ),
          ElevatedButton(
            onPressed: () {
              // Xử lý dữ liệu khi người dùng nhấn nút
              print('Tỉnh/Thành phố: $_selectedProvince');
              print('Quận/Huyện: $_selectedDistrict');
              print('Xã/Phường: $_selectedCommune');
            },
            child: Text('Xác nhận'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    // theme: ThemeData(
    //   fontFamily: 'VnTime', // Sử dụng font chữ 'Roboto' mặc định cho toàn bộ ứng dụng
    // ),
    // home: BirthdayInput(),
  ));
}
