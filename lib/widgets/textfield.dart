import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Widget? prefixIcon;
  final String myHintText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final bool isItPswd;

  const MyTextField({
    super.key,
    required this.textEditingController,
    this.prefixIcon,
    required this.myHintText,
    required this.textInputAction,
    required this.keyboardType,
    this.isItPswd = false,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  bool hidePswd = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 25, 0, 25),
        prefixIcon: widget.prefixIcon,
        hintText: widget.myHintText,
        hintStyle: TextStyle(
          color: Colors.grey.shade600
        ),
        suffixIcon: widget.isItPswd?(hidePswd?
        IconButton(
          icon: const Icon(Icons.visibility_rounded,size: 20,),
          onPressed: (){setState(() {
            hidePswd = !hidePswd;
          });},
          color: Colors.grey[600],
        ) : IconButton(
          icon: const Icon(Icons.visibility_off_rounded,size: 20,),
          onPressed: (){setState(() {
            hidePswd = !hidePswd;
          });},
          color: Colors.grey[600],
        )) : null,
        filled: true,
        fillColor: Colors.grey[200],
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.circular(21),
          ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.black,
              width: 2.0
          ),
          borderRadius: BorderRadius.circular(21),
        )
      ),
      controller: widget.textEditingController,
      obscureText: hidePswd,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
    );
  }
}
