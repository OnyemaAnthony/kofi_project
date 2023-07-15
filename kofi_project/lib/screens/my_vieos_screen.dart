import 'package:flutter/material.dart';
import 'package:kofi_project/widgets/dummy.dart';
import 'package:kofi_project/widgets/video_card.dart';

class MyVideosScreen extends StatefulWidget {
  const MyVideosScreen({Key? key}) : super(key: key);

  @override
  State<MyVideosScreen> createState() => _MyVideosScreenState();
}

class _MyVideosScreenState extends State<MyVideosScreen> {
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     backgroundColor: Colors.grey ,
     appBar: AppBar(
       title: const Text("My vidoes"),
     ),
     body:   ListView.builder(
     itemCount: videos.length,
     itemBuilder: (context, index) {
       VideoCard videoCard = videos[index];
       return Container(
         margin: const EdgeInsets.all(20.0),
         child: ClipRRect(
           borderRadius: BorderRadius.circular(5.0),
           child: Material(
             elevation: 5.0,
             borderRadius: BorderRadius.circular(5.0),
             color: Colors.white,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Stack(
                   children: <Widget>[
                     Image.network(videoCard.imageUrl!),
                     Positioned(
                       top: 20.0,
                       right: 10.0,
                       child: Container(
                         padding: const EdgeInsets.all(10.0),
                         color: Colors.white,
                         child: Text(DateTime.now().toString()),
                       ),
                     )
                   ],
                 ),
                 GestureDetector(
                   onTap: () async {},
                   child: Container(
                     padding: const EdgeInsets.all(16.0),
                     child: const Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         SizedBox(
                           height: 5.0,
                         ),
                         SizedBox(
                           height: 10.0,
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
       );
     },
     ),
   );
  }
}
