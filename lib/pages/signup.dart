import 'package:edialysis/widgets/dropdown.dart';
import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/textfield.dart';

class SignupPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  SignupPage({super.key});

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
                'SIGNUP',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35
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
              const SizedBox(height: 10),

              //sign-in button
              MyButton(text: 'Next', onTap: (){}, myIcon: Icons.arrow_forward,),

              //register now button
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
