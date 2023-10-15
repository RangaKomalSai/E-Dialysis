import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Widget? prefixIcon;
  final String myHintText;
  final bool myObscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  const MyTextField({
    super.key,
    required this.textEditingController,
    this.prefixIcon,
    required this.myHintText,
    this.myObscureText = false,
    required this.textInputAction,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 25),
        prefixIcon: prefixIcon,
        hintText: myHintText,
        hintStyle: const TextStyle(
          color: Colors.black
        ),
        filled: true,
        fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(21),
          ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Color.fromRGBO(47, 37, 245, 1),
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(21),
        )
      ),
      controller: textEditingController,
      obscureText: myObscureText,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
    );
  }
}
