import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kofi_project/screens/image_list_screen.dart';
import 'package:kofi_project/widgets/submit_button.dart';

class ConfirmImageScreen extends StatefulWidget {
  final File imageFile;
   ConfirmImageScreen({Key? key,required this.imageFile}) : super(key: key);

  @override
  State<ConfirmImageScreen> createState() => _ConfirmImageScreenState();
}

class _ConfirmImageScreenState extends State<ConfirmImageScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text("Confirm image"),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              const SizedBox(height: 20,),
             Material(
               //elevation: 2,
               child: Container(
                 width:MediaQuery.of(context).size.width *0.99,
                 height: 400,
                 decoration: BoxDecoration(
                   image: DecorationImage(image: AssetImage(widget.imageFile.path),fit: BoxFit.cover)

                 ),
               ),
             ),

              CheckboxListTile(

                title: const Text("Check this checkbox"),
                value: isChecked,
                activeColor: Colors.black,
                checkColor: Colors.white,
                onChanged: (newValue) {
                  setState(() {
                    isChecked = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              SubmitButton(text: "Upload",onPress: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ImageListScreen()));

              },),
            ],
          ),
        ),
      ),
    );
  }
}
