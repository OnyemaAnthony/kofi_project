import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kofi_project/screens/my_vieos_screen.dart';

import '../screens/confirm_screen.dart';

class DrawerItem extends StatefulWidget {
   DrawerItem({Key? key}) : super(key: key);

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  String cat = "Select video category";
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1624&q=80',
              fit: BoxFit.fill,
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.grey.shade300,

              child: drawerChild("Add video", Icons.upload, () {
                showOptionsDialog(context);

              })),

          drawerChild("View uploaded videos", Icons.video_call, () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyVideosScreen()));
          }),

          dropdownContainer(context),

        ],
      ),
    );
  }
  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmScreen(
            videoFile: File(video.path),
            videoPath: video.path,
          ),
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.gallery, context),
            child: const Row(
              children: [
                Icon(Icons.image),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Gallery',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => pickVideo(ImageSource.camera, context),
            child: const Row(
              children: [
                Icon(Icons.camera_alt),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Camera',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(),
            child: const Row(
              children: [
                Icon(Icons.cancel),
                Padding(
                  padding: EdgeInsets.all(7.0),
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerChild(
      String title, IconData icon, VoidCallback controller) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: controller,
    );
  }

  List<String> categories = ['Food', 'Entertainment', 'politics'];

  Container dropdownContainer(BuildContext context) {
    return Container(
     // margin: EdgeInsets.only(top: 0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SizedBox(width: 12,),
          Icon(
            Icons.category,
            color: Colors.grey.shade600,
          ),
          Container(
            //margin: const EdgeInsets.only(top: 0, left: 10.0, right: 0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                hint:  Text(
                  cat,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                  ),
                ),
                onChanged: (t){
                  print(t);
                  setState(() {
                    t = cat;
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



