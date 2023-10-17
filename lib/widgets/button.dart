import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData? myIcon;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.myIcon
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        padding: const EdgeInsets.all(25),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1
                ),
              ),
              SizedBox(width: 8,),
              Icon(myIcon, color: Colors.white, weight: 2, size: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
