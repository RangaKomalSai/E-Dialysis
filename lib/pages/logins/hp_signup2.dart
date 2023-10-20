import 'package:edialysis/pages/logins/hp_signup3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/textfield.dart';

class HpSignup2 extends StatefulWidget {
  final String name;
  final String license;

  HpSignup2({super.key, required this.name, required this.license});

  @override
  State<HpSignup2> createState() => _HpSignup2State();
}

class _HpSignup2State extends State<HpSignup2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final addressController = TextEditingController();
  String? selectedState;

  void onStateChanged(String newValue) {
    setState(() {
      selectedState = newValue;
    });
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[200],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: (){Get.back();},
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                const Text(
                  'Just a step away...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color:Color.fromRGBO(246, 82, 19, 1),
                  ),
                ),
                const SizedBox(height: 20,),
                MyTextField(
                  textEditingController: addressController,
                  myHintText: 'Complete Address',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                    validator: (address) {
                      if(address!.isEmpty){
                        return 'Address cannot be empty';}
                      return null;
                    }
                ),
                const SizedBox(height: 10,),

                MyDropDownList(selectedValue: selectedState,
                  onValueChanged: onStateChanged,),
                const SizedBox(height: 20,),

                //sign-in button
                MyButton(
                  text: 'Next',
                  onTap: (){
                    if (_formKey.currentState!.validate()){
                      Get.to(() =>
                          HpSignup3(
                              name: widget.name,
                              license: widget.license,
                              address: addressController.text,
                              state: selectedState!),
                          transition: Transition.rightToLeft);
                    }},
                  iconVisible: true,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
