import 'package:flutter/material.dart';

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
        title: Text('E-Dialysis', style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        items: const[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
          )
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
            print('$index , $_currentIndex');
          });
        },
      ),
    );
  }
}
