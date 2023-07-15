import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 800,
      width: 2000,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/logo_dark.jpg',height: 100,width: 150,),
          const Text('Got a burnign question?',style: TextStyle(color: Colors.white,fontSize: 20),),
          const Text('Reach us 24/7',style: TextStyle(color: Colors.white,fontSize: 20)),
          const Text('Info@kofyimages.com',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(height: 20,),
          const SizedBox(height: 15,),
          const Text('Cities',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 15,),
          const Text('FAQs',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 15,),
          const Text('Contact Us',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 25,),
          const Text('Customer',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(height: 15,),
          const Text('View Cart',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 15,),
          const Text('Terms and Conditions',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 15,),
          const Text('Privacy Policy',style: TextStyle(color: Colors.white,fontSize: 20)),
          const SizedBox(height: 15,),
          const Text('Subscribe',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          const SizedBox(height: 15,),
          const Text('We update our catalog regularly,',style: TextStyle(color: Colors.white,fontSize: 20)),
          const Text('Subscribe to stay update.,',style: TextStyle(color: Colors.white,fontSize: 20)),


          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
                child: TextFormField(

                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Enter Your Email",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 5,),
              Container(height: 50,width: 50,color: Colors.white,
              child: const Icon(FontAwesomeIcons.paperPlane,color: Colors.black,),
              )
            ],
          ),
          const SizedBox(height: 10,),

          Container(
            width: double.infinity,

              height: 100,color: Colors.grey.shade900,
            child: const Column(
              children: [
                Column(children: [
                  Text('©2023.kofyImages.All rights reserved',style: TextStyle(color: Colors.white,fontSize: 20)),
                ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.facebookF,color: Colors.white,),
                        SizedBox(width: 20),
                        Icon(FontAwesomeIcons.twitter,color: Colors.white,),
                        SizedBox(width: 30,),

                        Icon(FontAwesomeIcons.instagram,color: Colors.white,),

                      ],
                    )
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
