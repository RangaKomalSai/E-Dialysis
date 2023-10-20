import 'package:edialysis/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'mytext.dart';

Future<bool> showAlertDialog(BuildContext context, String message) async {
bool okClicked = false;
  showDialog(
      context: context,
      builder: (BuildContext context)
  {
    return AlertDialog(
      content: Text(message),
      actions: [
        GestureDetector(
          onTap: (){Get.back();},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: MyText(
              text:'Cancel',
              textStyle: TextStyle(
                color: rPrimary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
              ),
            ),
          ),
        ),
        const SizedBox(width: 15,),
        GestureDetector(
          onTap: (){okClicked = true; SystemNavigator.pop();},
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: MyText(
              text: 'Exit',
              textStyle: TextStyle(
                  color: rPrimary,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'
              ),
            ),
          ),
        ),
        const SizedBox(width: 5,)
      ],
    );
    },
  );
  return okClicked;
}