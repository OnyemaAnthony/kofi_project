import 'package:flutter/material.dart';
import 'package:kofi_project/screens/image_list_screen.dart';
import 'package:kofi_project/screens/video_list_screen.dart';

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
            leading: Image.asset(
              'assets/images/logo_light.jpg',
              height: 100,
              width: 100,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const VideoListScreen()));

                    },
                    child: const Text("Videos"),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: ElevatedButton(
                    style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const ImageListScreen()));
                    },
                    child: const Text("Photos"),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
