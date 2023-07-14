import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // here the desired height
    child: AppBar(
      backgroundColor: Colors.white,
    elevation: 0.0,
   leading: Image.asset('assets/images/logo_light.jpg',height: 100,width: 100,),
    ),),
      body: Container(child:Text('hello') ,),
    );

  }
}
