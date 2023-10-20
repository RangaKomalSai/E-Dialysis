import 'package:edialysis/constants/constants.dart';
import 'package:edialysis/pages/logins/login_page.dart';
import 'package:edialysis/pages/splash_screen.dart';
import 'package:edialysis/widgets/mytext.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/alertdialog.dart';
import '../widgets/gnav.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool userLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    userLoggedIn = await isUserLoggedIn();
  }
  Future<bool> isUserLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if(userLoggedIn){
          // bool okClicked = await showAlertDialog(context, 'Your error message here');
          return await showAlertDialog(context,  'Do you want to exit?');}
        else{
          return false;
        }
        },
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: const MyText(
            text: 'E-Dialysis',
            textStyle: TextStyle(
              fontFamily: 'Poppins',
              color: rDark,
              fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),

        bottomNavigationBar: MyGNav()
      ),
    );
  }
}
