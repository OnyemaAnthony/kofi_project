import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:kofi_project/widgets/footer.dart';
import '../widgets/dummy.dart';
import '../widgets/video_card.dart';

class MyPhotosScreen extends StatefulWidget {
  const MyPhotosScreen({Key? key}) : super(key: key);

  @override
  State<MyPhotosScreen> createState() => _MyPhotosScreenState();
}

class _MyPhotosScreenState extends State<MyPhotosScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white ,
      appBar: AppBar(
        leadingWidth: 0,
        titleSpacing: 0,
        centerTitle: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>MyPhotosScreen()));
              },
                child: Image.asset('assets/images/logo_light.jpg',width: 150,height: 100,)),
            const Text('My Photos',style: TextStyle(color:Colors.black),)

          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()async{
          await Future.delayed(const Duration(milliseconds: 300));
          SchedulerBinding.instance.addPostFrameCallback((_) {
            _scrollController.animateTo(
                _scrollController.position.minScrollExtent,
                duration: const Duration(milliseconds: 400),
                curve: Curves.fastOutSlowIn);
          });

        },
        child: const Icon(Icons.arrow_upward,color: Colors.white,),


      ),
      body:   ListView.builder(
        controller: _scrollController,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          VideoCard videoCard = videos[index];
          if(index == videos.length-1){
            return Footer();
          }
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(videoCard.imageUrl!),
                    Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.white,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text('Category',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.w600),),
                        Divider(thickness: 2,),
                        SizedBox(height: 10,),
                        Text('The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using,',style: TextStyle(),),
                        SizedBox(height: 10),
                        Row(children: [
                          Icon(Icons.access_time),
                          SizedBox(width: 5,),
                          Text('8:00',style: TextStyle(fontSize: 20),),
                        ],)


                      ],
                    ),),
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
