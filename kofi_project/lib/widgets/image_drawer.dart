import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kofi_project/screens/confirm_image_screen.dart';
import 'package:kofi_project/screens/my_photos_screen.dart';
import 'package:kofi_project/screens/my_vieos_screen.dart';

import '../screens/confirm_screen.dart';

class ImageDrawer extends StatefulWidget {
  ImageDrawer({Key? key}) : super(key: key);

  @override
  State<ImageDrawer> createState() => _ImageDrawerState();
}

class _ImageDrawerState extends State<ImageDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        children: [
          Divider(),
          SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/images/logo_light.jpg'),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.grey.shade300,

              child: drawerChild("Add photos", Icons.upload, () {
                showOptionsDialog(context);

              })),

          drawerChild("View uploaded Photos", Icons.video_call, () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyPhotosScreen()));
          }),

        ],
      ),
    );
  }
  pickVideo(ImageSource src, BuildContext context) async {
    final image = await ImagePicker().pickImage(source: src);
    if (image != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ConfirmImageScreen(
            imageFile: File(image.path),
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
          const SizedBox(width: 12,),
          Icon(
            Icons.category,
            color: Colors.grey.shade600,
          ),

        ],
      ),
    );
  }
}



