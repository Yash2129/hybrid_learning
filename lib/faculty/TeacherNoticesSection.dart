import 'package:flutter/material.dart';

class TeacherNoticesSection extends StatefulWidget {
  const TeacherNoticesSection({Key? key}) : super(key: key);

  @override
  State<TeacherNoticesSection> createState() => _TeacherNoticesSectionState();
}

class _TeacherNoticesSectionState extends State<TeacherNoticesSection> {
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
          Row(
            children: [
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

                padding: EdgeInsets.only(left: 50, right: 20,top: 15),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 6,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      backgroundColor: const Color(0xFF0090FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(

                      'Circular Upload',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold',)
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
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


          Row(
            children: [

              Container(
                padding: const EdgeInsets.only(left:20,top: 40, bottom: 20),
                alignment: Alignment.topLeft,
                child: const Text('Notices',style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Quicksand_Bold',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF244462),
                ),),

              ),

              Container(

                padding: EdgeInsets.only(left: 70, right: 20,top: 15),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      elevation: 6,
                      padding: EdgeInsets.only(left: 10,right: 10),
                      backgroundColor: const Color(0xFF0090FF),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(

                      'Notices Upload',textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold',)
                  ),
                  onPressed: () {

                  },
                ),
              ),
            ],
          ),
          // Notices

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
