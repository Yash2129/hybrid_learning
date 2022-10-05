import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/student/StudentMainScreen.dart';

class StudentAttendanceSection extends StatefulWidget {
  const StudentAttendanceSection({Key? key}) : super(key: key);

  @override
  State<StudentAttendanceSection> createState() => _StudentAttendanceSectionState();
}

class _StudentAttendanceSectionState extends State<StudentAttendanceSection> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              InkWell(
                onTap: () {
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=> StudentMainScreen()));
                },
                child:  Container(
                  padding: EdgeInsets.only(left: 20,top: 30),
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.arrow_back_ios,size: 30),
                ),
              ),



              //BOX names
              SizedBox(height: height*0.03),

              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Machine Learning',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),

              SizedBox(height: height*0.05),

              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Natural Language Processing',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),


              SizedBox(height: height*0.05),


              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Blockchain',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),

              SizedBox(height: height*0.05),


              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Big Data Analytics',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),

              SizedBox(height: height*0.05),


              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Cybersecurity and Laws',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),

              SizedBox(height: height*0.05),

              InkWell(
                onTap: () {

                },
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                  height: height*0.09,
                  width: width*0.9,
                  decoration: BoxDecoration(
                      color: Color(0xFF8ECEFF),
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Text('Management of Information System',style: TextStyle(
                    fontSize: 21,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),



            ]
        ),

      ),
    );
  }
}





