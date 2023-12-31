import 'package:flutter/material.dart';
import 'package:kofi_project/widgets/image_drawer.dart';
import '../widgets/dummy.dart';
import '../widgets/footer.dart';
import '../widgets/video_card.dart';

class ImageListScreen extends StatefulWidget {
  const ImageListScreen({Key? key}) : super(key: key);

  @override
  State<ImageListScreen> createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  bool isBottom = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _key,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        //title: const Text("Welcome Anthony"),
        title: Row(
          children: [
            GestureDetector(
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>ImageListScreen()));
                },
                child: Image.asset('assets/images/logo_light.jpg',width: 150,height: 100,)),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: (){
                _key.currentState!.openDrawer();
              },
              child: const Padding(
                padding: EdgeInsets.all(15),
                child: Icon(Icons.menu,color: Colors.black,),
              ))
        ],
      ),
      drawer:ImageDrawer(),
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        color: const Color(0xffD9D9D9),
        child: NotificationListener<ScrollEndNotification>(
          onNotification: (scrollEnd) {
            final metrics = scrollEnd.metrics;
            if (metrics.atEdge) {
              bool isTop = metrics.pixels == 0;
              if (isTop) {
                print('At the top');
              } else {
                setState(() {
                  isBottom = true;
                  isBottom = false;

                });
              }
            }
            return true;
          },
          child: GridView.builder(
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isBottom?1:3,
                childAspectRatio: 7/9,
                mainAxisSpacing: 10,
                crossAxisSpacing: 2,
              ),

              itemCount: videos.length,
              itemBuilder: (BuildContext context, index) {
                VideoCard video = videos[index];
                if(isBottom){
                  return Footer();
                }

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

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const  Text("Upload images here"),
    //   ),
    //   body: SingleChildScrollView(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //
    //         Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Container(
    //             decoration: const BoxDecoration(
    //               color: Colors.black
    //             ),
    //             width: double.infinity,
    //             height: 400,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 Image.asset("assets/images/logo_dark.jpg",height: 50,width: 50,),
    //                 const Text("Got a burning question?.",style: TextStyle(color: Colors.white),),
    //                 const Text("Reach us 24/7"),
    //
    //
    //               ],
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );

  }
}
