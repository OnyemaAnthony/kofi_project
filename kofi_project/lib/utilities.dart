import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utilities{


 static void showToast(String message){
    Fluttertoast.showToast(
        msg:message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }
}