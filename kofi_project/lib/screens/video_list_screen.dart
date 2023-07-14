import 'package:flutter/material.dart';
import 'package:kofi_project/widgets/drawer_item.dart';
import 'package:kofi_project/widgets/video_card.dart';

import '../widgets/dummy.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}


class _VideoListScreenState extends State<VideoListScreen> {

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Welcome Anthony"),
        actions: [
          GestureDetector(
            onTap: (){
              _key.currentState!.openDrawer();
            },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Icon(Icons.menu),
              ))
        ],
      ),
    drawer:DrawerItem(),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          color: const Color(0xffD9D9D9),
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 7/9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2,
              ),

              itemCount: videos.length,
              itemBuilder: (BuildContext context, index) {
                VideoCard video = videos[index];
                return GestureDetector(
                  onTap: (){
                  },
                  child:VideoCard (
                    title: video.title,
                    price: video.price,
                    imageUrl: video.imageUrl,
                  ),
                );

              }),
        ),
      ),
    );
  }
}
