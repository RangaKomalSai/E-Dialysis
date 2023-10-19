import 'package:edialysis/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/button.dart';
import '../../widgets/textfield.dart';

class SignupPage extends StatefulWidget {

  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

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
                  keyboardType: TextInputType.text
              ),
              const SizedBox(height: 10,),
              MyTextField(
                  textEditingController: emailController,
                  myHintText: 'Email id',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress
              ),
              const SizedBox(height: 10),

              MyDropDownList(),
              const SizedBox(height: 20),

              //sign-in button
              MyButton(
                text: 'Next',
                onTap: (){Navigator.of(context).pushNamed('/signup2');},
                myIcon: Icons.arrow_forward,
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
                    onTap: (){Navigator.of(context).pushNamed('/login');},
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
    );
  }
}
