import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

   SubmitButton({Key? key,required this.text,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        width: 300,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
              color: Colors.black,

        ),
        child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),

      ),
    );
  }
}
