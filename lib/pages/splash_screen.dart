import 'package:edialysis/pages/home_page.dart';
import 'package:edialysis/pages/role_selection.dart';
import 'package:edialysis/pages/logins/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'logins/login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool userLoggedIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      checkUserAndNavigate();
    });
  }

  void checkUserAndNavigate() async {
    userLoggedIn = await isUserLoggedIn();
    _whichScreenToDisplay();
  }

  Future<bool> isUserLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  void _whichScreenToDisplay() {
    if (userLoggedIn) {
      Get.offAll(() => HomePage());
    } else {
      Get.offAll(() => RoleSelection());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Lottie.network('https://lottie.host/8577f454-f813-4d85-b1e1-22f4079753f6/8UHJ6x1SBv.json',
        height: 250),
      ),
    );
  }
}
