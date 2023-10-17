import 'package:flutter/material.dart';

import '../widgets/button.dart';
import '../widgets/dropdown.dart';
import '../widgets/textfield.dart';

class Signup2 extends StatelessWidget {

  Signup2({super.key});

  final pswdController = TextEditingController();

  final pswdConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back_rounded, color: Colors.black,),

      ),
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
              const SizedBox(height: 20,),

              //sign-in button
              MyButton(text: 'Signup', onTap: (){}, myIcon: Icons.arrow_forward,),

              //register now button
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
