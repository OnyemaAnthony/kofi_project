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
           child: Image.asset('assets/images/logo_light.jpg'),
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

}



