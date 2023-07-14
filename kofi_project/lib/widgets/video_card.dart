import 'package:flutter/material.dart';
class VideoCard extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? price;
  VideoCard({Key? key,this.imageUrl,this.price,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = 1;
    double ffem = 1;
    return Container(
      margin: const EdgeInsets.only(left: 5,right: 5),
      padding:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
      width:  170*fem,
      height:  200,
      decoration:  BoxDecoration (
        color:  const Color(0xffffffff),
        borderRadius:  BorderRadius.circular(10*fem),
      ),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children:  [
          Container(
            margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5),
            width:  double.infinity,
            height:  130,
            decoration:  BoxDecoration (
              borderRadius:  BorderRadius.circular(10*fem),
              color:  const Color(0xffd9d9d9),
              image:  DecorationImage (
                fit:  BoxFit.cover,
                image:  NetworkImage (
                    imageUrl!
                ),
              ),
            ),
          ),
          Container(
            //margin:  EdgeInsets.fromLTRB(10.5*fem, 0*fem, 0*fem, 14.59*fem),
            child:
            Text(
              title!,
              style:  TextStyle (
                fontSize:  13*ffem,
                fontWeight:  FontWeight.w700,
                height:  1.2125*ffem/fem,
                color:  const Color(0xff000000),
              ),
            ),
          ),
          // Container(
          //   // rZV (0:124)
          //   margin:  EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 0*fem),
          //   child:
          //   Text(
          //     price!,
          //     style:  TextStyle (
          //       fontSize:  10*ffem,
          //       fontWeight:  FontWeight.w700,
          //       height:  1.2125*ffem/fem,
          //       color:  const Color(0xff000000),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
