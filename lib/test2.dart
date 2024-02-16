import 'package:employee_manager/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class HomeDemo extends StatelessWidget {
  const HomeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController(); // Tạo một TextEditingController mới

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              textEditingController: textEditingController, // Truyền TextEditingController vào đây
              hintText: 'Test',
              icon: Icons.abc,
              title: 'hello',
              message: 'hi',
            ),
          ],
        ),
      ),
    );
  }
}
