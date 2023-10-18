import 'package:edialysis/pages/home_page.dart';
import 'package:edialysis/pages/login_page.dart';
import 'package:edialysis/pages/signup.dart';
import 'package:edialysis/pages/signup2.dart';
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
          case '/signup2':
            return PageTransition(
              child: Signup2(),
              type: PageTransitionType.rightToLeft,
              duration: Duration(milliseconds: 400),
              settings: settings,
            );
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
