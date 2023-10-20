import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edialysis/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/button.dart';
import '../../widgets/dropdown.dart';
import '../../widgets/snackbar.dart';
import '../../widgets/textfield.dart';

class HpSignup3 extends StatefulWidget {
  final String name;
  final String license;
  final String address;
  final String state;

  HpSignup3({super.key, required this.name, required this.license, required this.address, required this.state});

  @override
  State<HpSignup3> createState() => _HpSignup3State();
}

class _HpSignup3State extends State<HpSignup3> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pswdController = TextEditingController();
  final emailController = TextEditingController();
  final pswdConfirmController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future _signUpWithEmailAndPassword(String name,String license, String address, String state, String password) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: password
      );
      await FirebaseFirestore.instance.collection('HpUsers').doc(userCredential.user!.uid).set({
        'Name' : name,
        'License': license,
        'Address':address,
        'State':state,
      });
      Get.off(()=> HomePage(),transition: Transition.zoom);
    } on FirebaseAuthException catch (ex){
      showSnackBar(context, ex.code.toString());
    }
  }

  bool _checkPswd(pswd, confirmPswd){
    if(_formKey.currentState!.validate()){
      if(pswd == confirmPswd){return true;}
      else {
        showSnackBar(context, 'Passwords don\'t match');
        return false;
      }}
    return false;
  }

  @override
  void dispose() {
    pswdController.dispose();
    emailController.dispose();
    pswdConfirmController.dispose();
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
                  'Almost there...',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color:Color.fromRGBO(246, 82, 19, 1),
                  ),
                ),
                const SizedBox(height: 20,),
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
                const SizedBox(height: 10,),
                MyTextField(
                  textEditingController: pswdController,
                  myHintText: 'Create your Password',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  isItPswd: true,
                    validator: (pswd) {
                      if(pswd!.isEmpty || pswd.length < 6){
                        return 'Please enter a valid password';}
                      return null;
                    }
                ),
                const SizedBox(height: 10,),
                MyTextField(
                  textEditingController: pswdConfirmController,
                  myHintText: 'Re-enter Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  isItPswd: true,
                    validator: (pswd) {
                      if(pswd!.isEmpty || pswd.length < 6){
                        return 'Please enter a valid password';}
                      return null;
                    }
                ),
                const SizedBox(height: 20,),

                //sign-in button
                MyButton(
                  text: 'Signup',
                  onTap: (){
                    if(_checkPswd(pswdController.text, pswdConfirmController.text)){_signUpWithEmailAndPassword(widget.name, widget.license, widget.address, widget.state, pswdController.text.trim());}},
                  iconVisible: true,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
