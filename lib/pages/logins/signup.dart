import 'package:edialysis/pages/logins/login_page.dart';
import 'package:edialysis/pages/logins/signup2.dart';
import 'package:edialysis/widgets/dropdown.dart';
import 'package:edialysis/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield.dart';

class SignupPage extends StatefulWidget {

  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String? selectedState;

  void onStateChanged(String newValue) {
    setState(() {
      selectedState = newValue;
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Create Account',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 35,
                    color: Color.fromRGBO(246, 82, 19, 1),
                  ),
                ),
                const SizedBox(height: 20,),
                MyTextField(
                    textEditingController: nameController,
                    myHintText: 'Name',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: (name) {
                      if(name!.isEmpty){
                        return 'Please enter your Name';}
                      return null;
                    }
                ),
                const SizedBox(height: 10,),
                MyTextField(
                    textEditingController: emailController,
                    myHintText: 'Email id',
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: (email) {
                      if(email!.isEmpty || !email.contains('@')){
                        return 'Please enter a valid email';}
                      return null;
                    }
                ),
                const SizedBox(height: 10),

                MyDropDownList(selectedValue: selectedState,
                  onValueChanged: onStateChanged,),
                const SizedBox(height: 20),

                //sign-in button
                MyButton(
                  text: 'Next',
                  onTap: () {
                    if (selectedState == null) {
                      showSnackBar(context, 'Select your state');
                    }
                    else if(_formKey.currentState!.validate()){
                      Get.to(() =>
                          Signup2(email: emailController.text,
                              name: nameController.text,
                              state: selectedState!),
                          transition: Transition.rightToLeft);
                    }},
                  iconVisible: true,
                ),

                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account ? ',
                      style: TextStyle(
                          color: Colors.black,letterSpacing: 1
                      ),
                    ),
                    GestureDetector(
                      // onTap: (){Navigator.of(context).pushNamed('/login');},
                      onTap: (){Get.to(()=>LoginPage(),transition: Transition.downToUp);},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromRGBO(246, 82, 19, 1),
                            fontWeight: FontWeight.bold ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
