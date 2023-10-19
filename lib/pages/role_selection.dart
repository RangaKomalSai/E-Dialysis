import 'package:edialysis/widgets/button.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              children: [
                const Text('Let\'s get started...', style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Ubuntu',
                  fontWeight: FontWeight.bold
                ),),
                const SizedBox(height: 30,),
                MyButton(text: 'I\'m a patient', onTap: (){Navigator.of(context).pushNamed('/signup');}, iconVisible: false,),
                const SizedBox(height: 10,),
                MyButton(text: 'I\'m a healthcare provider', onTap: (){Navigator.of(context).pushNamed('/hp_signup');},iconVisible: false,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
