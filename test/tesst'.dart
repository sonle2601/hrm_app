import 'package:flutter/material.dart';

class ValidationScreen extends StatefulWidget {
  const ValidationScreen({Key? key}) : super(key: key);

  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());

  void _submitForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    // Combine entered codes
    String code = _controllers.map((controller) => controller.text).join();
    // Handle form submission, e.g., validate the code
    print('Validating code: $code');
    // Your validation logic goes here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validation Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Phần mô tả code
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Please enter the validation code sent to your device',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Phần nhập code
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                      (index) => SizedBox(
                    width: 40,
                    child: TextFormField(
                      controller: _controllers[index],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        counterText: '',
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a digit';
                        }
                        // You can add additional validation logic here if needed
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Nút Validate
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: _submitForm,
              child: Text('Validate'),
            ),
          ),
        ],
      ),
    );
  }
}
