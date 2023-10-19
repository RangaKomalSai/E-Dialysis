import 'package:edialysis/pages/home_page.dart';
import 'package:edialysis/pages/logins/hp_login_page.dart';
import 'package:edialysis/pages/logins/hp_signup.dart';
import 'package:edialysis/pages/logins/hp_signup2.dart';
import 'package:edialysis/pages/logins/hp_signup3.dart';
import 'package:edialysis/pages/logins/login_page.dart';
import 'package:edialysis/pages/logins/signup.dart';
import 'package:edialysis/pages/logins/signup2.dart';
import 'package:edialysis/pages/splash_screen.dart';
import 'package:edialysis/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return PageTransition(
              child: LoginPage(),
              type: PageTransitionType.bottomToTop,
              duration: const Duration(milliseconds: 400),// Another example of transition
              settings: settings,
            );
          case '/signup':
            return PageTransition(
              child: SignupPage(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 400),// Another example of transition
              settings: settings,
            );
          case '/signup2':
            return PageTransition(
              child: Signup2(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 400),
              settings: settings,
            );
          case '/hp_login':
            return PageTransition(
              child: HpLoginPage(),
              type: PageTransitionType.bottomToTop,
              duration: const Duration(milliseconds: 400),// Another example of transition
              settings: settings,
            );
          case '/hp_signup':
            return PageTransition(
              child: HpSignupPage(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 400),// Another example of transition
              settings: settings,
            );
          case '/hp_signup2':
            return PageTransition(
              child: HpSignup2(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 400),// Another example of transition
              settings: settings,
            );
          case '/hp_signup3':
            return PageTransition(
              child: HpSignup3(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 400),
              settings: settings,
            );
          case '/homepage':
            return PageTransition(
              child: HomePage(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 400),
              settings: settings,
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(body: Center(child: Text('Error!', style: TextStyle(fontSize: 20),),),),
              settings: settings,
            );
        }
      },
      title: 'E-Dialysis',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: Splash(),
    );
  }
}
