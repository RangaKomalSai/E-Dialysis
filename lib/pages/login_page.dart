import 'package:edialysis/widgets/button.dart';
import 'package:edialysis/widgets/textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  LoginPage({super.key});

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
                'Login',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 35,
                  color: Color.fromRGBO(246, 82, 19, 1),
                ),
              ),
              const SizedBox(height: 20,),
              MyTextField(
                  textEditingController: emailController,
                  myHintText: 'Email id',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress
              ),
              const SizedBox(height: 20),
              MyTextField(
                  textEditingController: pswdController,
                  myHintText: 'Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  isItPswd: true,
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      'Forgot Password?  ',
                      style: TextStyle(
                        color: Color.fromRGBO(246, 82, 19, 1),
                        fontWeight: FontWeight.bold ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),

              //sign-in button
              MyButton(text: 'Login', onTap: (){}),

              //register now button
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'New User? ',
                    style: TextStyle(
                      color: Colors.black,letterSpacing: 1
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.pop(context);},
                    child: const Text(
                      'Create Account',
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
