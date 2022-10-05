import 'package:flutter/material.dart';

class ParentsNoticeSection extends StatefulWidget {
  const ParentsNoticeSection({Key? key}) : super(key: key);

  @override
  State<ParentsNoticeSection> createState() => _ParentsNoticeSectionState();
}

class _ParentsNoticeSectionState extends State<ParentsNoticeSection> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.topLeft,
              child: const Icon(Icons.arrow_back_ios_rounded,size: 30),
            ),
          ),


          //Circular Section
          Container(
            padding: EdgeInsets.only(left:20,bottom: 10,top: 30),
            alignment: Alignment.topLeft,
            child: const Text('Circulars',style: TextStyle(
              fontSize: 25,
              fontFamily: 'Quicksand_Bold',
              fontWeight: FontWeight.w900,
              color: Color(0xFF244462),
            ),),

          ),

          Container(
            height: height*0.33,
            width: width*0.9,
            decoration: BoxDecoration(

              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(50) ,bottomRight: Radius.circular(10),topRight: const Radius.circular(50)),
              boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 4.0,
                  offset: const Offset(-10,10)
              )],
              color: const Color(0xFF8ECEFF),
            ),
          ),


          // Notices
          Container(
            padding: const EdgeInsets.only(left:20,top: 40),
            alignment: Alignment.topLeft,
            child: const Text('Notices',style: TextStyle(
              fontSize: 25,
              fontFamily: 'Quicksand_Bold',
              fontWeight: FontWeight.w900,
              color: Color(0xFF244462),
            ),),

          ),
          Container(
            height: height*0.33,
            width: width*0.9,
            decoration: BoxDecoration(

              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(50) ,bottomRight: Radius.circular(10),topRight: Radius.circular(50)),
              boxShadow: [BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 4.0,
                  offset: const Offset(-10,10)
              )],
              color: Color(0xFF244462),
            ),
          ),


        ],
      ),
    );
  }
}
