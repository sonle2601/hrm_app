import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextArea extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String hintText;
  final int? maxLines;
  final TextInputType keyboardType;
  final bool enable;
  final Icon? icon;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  AppTextArea({
    Key? key,
    this.textEditingController,
    required this.hintText,
    this.keyboardType = TextInputType.multiline,
    this.maxLines = 1,
    this.enable = true,
    this.icon,
    this.inputFormatters,
    this.onEditingComplete, this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: enable ? Colors.white : Colors.lightBlueAccent.withOpacity(0.1),
        boxShadow: enable ?  [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 7,
            offset: Offset(1, 10),
            color: Colors.grey.withOpacity(0.2),
          )
        ] : null,
      ),
      child: TextFormField(
        inputFormatters: inputFormatters,
        enabled: enable,
        keyboardType: keyboardType,
        controller: textEditingController,
        maxLines: maxLines,
        style: TextStyle(
          color: enable ? Colors.black87 : Colors.black87, // Màu chữ khi enable và khi disable
        ),
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: TextStyle(
            color: Colors.black45
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: icon,
        ),
        onEditingComplete: () {
          onEditingComplete?.call();
        },
        onFieldSubmitted: (value) {
          onSubmitted?.call(value);
          FocusScope.of(context).unfocus(); // Tắt bàn phím
        },
      ),
    );
  }
}
