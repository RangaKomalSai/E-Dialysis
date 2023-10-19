import 'package:flutter/material.dart';

import '../widgets/gnav.dart';
import '../widgets/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'E-Dialysis',
           style: TextStyle(
               color: Colors.black
           ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: MyGNav()
    );
  }
}
