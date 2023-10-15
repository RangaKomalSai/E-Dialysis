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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                ),
              ),
              const SizedBox(height: 10,),
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
                  myObscureText: true,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),

              //sign-in button
              MyButton(text: 'Login', onTap: (){})
              //register now button
            ],
          ),
        ),
      ),
    );
  }
}
