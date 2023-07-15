import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kofi_project/screens/video_list_screen.dart';
import 'package:kofi_project/utilities.dart';
import 'package:kofi_project/widgets/submit_button.dart';
import 'package:video_player/video_player.dart';

import '../widgets/text_input_field.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String selectedCategory = 'Food';
  late VideoPlayerController controller;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    // controller.play();
    // controller.setVolume(1);
    // controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  List<String> categories = ['Food', 'Entertainment', 'politics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height *0.5,
              child: VideoPlayer(controller),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _songController,
                      labelText: 'Name of video',
                      icon: Icons.abc_sharp,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TextInputField(
                      controller: _captionController,
                      labelText: 'Caption',
                      icon: Icons.closed_caption,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton(
                    padding: EdgeInsets.all(20),

                    hint: const Text('Please choose a location'), // Not necessary for Option 1
                    value: selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue!;
                      });
                    },
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        
                        value: category,
                        child:  Text(category),
                      );
                    }).toList(),
                  ),


                  //dropdownContainer(context),

                  Container(
                    margin: EdgeInsets.all(20),
                    child: SubmitButton(text: "Upload", onPress: (){
                          Utilities.showToast("Video uploaded successfully");
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const VideoListScreen()));

                    }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Container dropdownContainer(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //const SizedBox(width: 12,),
          Container(
            //margin: const EdgeInsets.only(top: 0, left: 10.0, right: 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint:  Text(
                  "Category",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                onChanged: (t){
                  print(t);
                  setState(() {
                    //t = cat;
                  });

                },

                items: categories.map<DropdownMenuItem<String>>((setLanguage) =>
                    DropdownMenuItem<String>(
                      value: setLanguage,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(setLanguage),
                          Text(
                            setLanguage,
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
