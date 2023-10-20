import 'package:edialysis/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/button.dart';
import '../../widgets/snackbar.dart';
import '../../widgets/textfield.dart';

class Signup2 extends StatefulWidget {
  final String email;
  final String name;
  final String state;
  Signup2({super.key, required this.email, required this.name, required this.state});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final pswdController = TextEditingController();
  final pswdConfirmController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future _signUpWithEmailAndPassword(String name,String email, String state, String password, String confirmPassword) async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      // addUserDetails(nameController.text.trim());
      await FirebaseFirestore.instance.collection('Users').doc(userCredential.user!.uid).set({
        'email': email,
        'Name' : name,
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
    // Dispose of the controllers when the widget is removed from the widget tree
    pswdController.dispose();
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
                  'Create Account',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    color:Color.fromRGBO(246, 82, 19, 1),
                  ),
                ),
                const SizedBox(height: 20,),
                MyTextField(
                  textEditingController: pswdController,
                  myHintText: 'Create your Password',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  isItPswd: true,
                    validator: (pswd) {
                      if(pswd!.isEmpty || pswd.length < 6){
                        return 'Please create a valid password';}
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
                        return 'Please create a valid password';}
                      return null;
                    }
                ),
                const SizedBox(height: 20,),

                //sign-in button
                MyButton(
                  text: 'Signup',
                  onTap: (){
                    if(_checkPswd(pswdController.text, pswdConfirmController.text)){_signUpWithEmailAndPassword(widget.name, widget.email, widget.state, pswdController.text, pswdConfirmController.text);}},
                  iconVisible: true,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

