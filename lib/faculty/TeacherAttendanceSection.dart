import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/faculty/FacultyMainScreen.dart';

class TeacherAttendanceSection extends StatefulWidget {
  const TeacherAttendanceSection({Key? key}) : super(key: key);

  @override
  State<TeacherAttendanceSection> createState() => _TeacherAttendanceSectionState();
}

class _TeacherAttendanceSectionState extends State<TeacherAttendanceSection> {
  @override
  Widget build(BuildContext context) {

    String div1 = "BE-A";
    String div2 = "BE-B";
    String div3 = "BE-C";

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
                  Navigator.pop(context, MaterialPageRoute(builder: (context)=> FacultyMainScreen()));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FacultySubjectAttendance(div: div1)));
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

                  child: Text('BE-A',style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),

              SizedBox(height: height*0.05),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FacultySubjectAttendance(div: div2)));
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

                  child: Text('BE-B',style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                  ),),
                ),
              ),


              SizedBox(height: height*0.05),


              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FacultySubjectAttendance(div: div3)));
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

                  child: Text('BE-C',style: TextStyle(
                    fontSize: 24,
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


class FacultySubjectAttendance extends StatefulWidget {
  const FacultySubjectAttendance({Key? key, required this.div}) : super(key: key);
  final String div;
  @override
  State<FacultySubjectAttendance> createState() => _FacultySubjectAttendanceState();

}

class _FacultySubjectAttendanceState extends State<FacultySubjectAttendance> {
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

              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> TeacherAttendanceSection()));
                    },
                    child:  Container(
                      padding: EdgeInsets.only(left: 20,top: 30),
                      alignment: Alignment.topLeft,

                      child: Icon(Icons.arrow_back_ios,size: 30),
                    ),
                  ),

                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20,top: 35,bottom: 10),
                    height: height*0.1,
                    width: width*0.8,


                    child: Text('${widget.div}',style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Quicksand_Bold',
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF244462),
                    ),),
                  ),
                ],
              ),





              //BOX names
              SizedBox(height: height*0.03),

              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentDetails(div: widget.div)));
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

class StudentDetails extends StatefulWidget {
  const StudentDetails({Key? key, required this.div}) : super(key: key);
  final String div;

  @override
  State<StudentDetails> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [BoxShadow(
              color: Color(0xFFE3E3E3),
              blurRadius: 40,
              offset: Offset(0,20)
          )]
      ),
      alignment: Alignment.topCenter,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            elevation: 6,
            padding: const EdgeInsets.symmetric(horizontal: 132, vertical: 12),
            backgroundColor: const Color(0xFF0090FF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        child: const Text(

            'Register',
            style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
        ),
        onPressed: () async{



          FirebaseFirestore.instance.collection("Parents").get().then(
                (value) {
              value.docs.forEach(
                    (element) {
                  print(element.data());
                },
              );
            },
          );

        },
      ),
    );

  }
}
