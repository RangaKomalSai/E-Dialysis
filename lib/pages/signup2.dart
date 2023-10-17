import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/dropdown.dart';
import '../widgets/textfield.dart';

class Signup2 extends StatefulWidget {

  Signup2({super.key});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final pswdController = TextEditingController();

  final pswdConfirmController = TextEditingController();

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
                textEditingController: pswdController,
                myHintText: 'Create your Password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                isItPswd: true,
              ),
              const SizedBox(height: 10,),
              MyTextField(
                textEditingController: pswdConfirmController,
                myHintText: 'Re-enter Password',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                isItPswd: true,
              ),
              const SizedBox(height: 10,),

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
