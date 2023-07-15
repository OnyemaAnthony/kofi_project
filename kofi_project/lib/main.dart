import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kofi_project/screens/add_video_screen.dart';
import 'package:kofi_project/screens/home_screen.dart';
import 'package:kofi_project/screens/image_list_screen.dart';
import 'package:kofi_project/screens/video_list_screen.dart';
import 'package:kofi_project/screens/upload_video_screen.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,

    ),
        home:HomeScreen() ,

    );
  }
}

