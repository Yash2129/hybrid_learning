import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_learning_application/faculty/ParentsInteractionSection.dart';
import 'package:hybrid_learning_application/parent/ParentProfileView.dart';
import 'package:hybrid_learning_application/parent/ParentsAttendanceSection.dart';
import 'package:hybrid_learning_application/parent/ParentsCourseSection.dart';
import 'package:hybrid_learning_application/parent/ParentsExaminationSection.dart';
import 'package:hybrid_learning_application/parent/ParentsNoticeSection.dart';
import 'package:hybrid_learning_application/parent/ParentsStudentPerformanceSection.dart';

class ParentMainScreen extends StatefulWidget {
  const ParentMainScreen({Key? key}) : super(key: key);

  @override
  State<ParentMainScreen> createState() => _ParentMainScreenState();
}

class _ParentMainScreenState extends State<ParentMainScreen> {
  @override
  Widget build(BuildContext context) {

    DateTime pre_backpress = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return WillPopScope(
        onWillPop: () async{
      final timegap = DateTime.now().difference(pre_backpress);
      final cantExit = timegap >= Duration(seconds: 2);
      pre_backpress = DateTime.now();
      if(cantExit){
        //show snackbar
        final snack = SnackBar(content: Text('Press Back button again to Exit'),duration: Duration(seconds: 2),);
        ScaffoldMessenger.of(context).showSnackBar(snack);
        return false;
      }else{
        SystemNavigator.pop();
        return false;
      }
    },
    child:Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Card Design
              Container(
                height: 210,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                    color: Color(0xFF244462),
                    border: Border.all(width: 0),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50)
                    )

                ),
                child: Stack(
                  children: [


                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ParentProfileView()),
                      ),
                      child: Container(

                          alignment: Alignment.topRight,

                          padding: const EdgeInsets.only(right: 20,top: 20),
                          child: const Icon(Icons.settings,size: 30,color: Colors.white),
                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50)
                              )

                          )

                      ),
                    ),
                    Positioned(
                        top:60,
                        left: 0,
                        child: Container(
                          height: 90,
                          width: 300,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50),
                                  bottomRight: Radius.circular(50)
                              )
                          ),
                        )),

                    const Positioned(
                        top: 85,
                        left: 10,
                        child: Text("Welcome, Parent",
                            style: TextStyle(
                                fontFamily: 'Quicksand_Bold',
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF244462),
                                fontSize: 28)
                        )
                    )
                  ],
                ),
              ),

              SizedBox(height: height*0.05),

              //Attendance
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsAttendanceSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF8ECEFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/attendance.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Attendance                 ",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),



              SizedBox(height: height*0.05),

              //Student Performance
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsStudentPerformanceSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF244462),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/studentPerformance.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Student Performance",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),



              SizedBox(height: height*0.05),

              //Course Updates
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsCourseSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF8ECEFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.fitWidth,
                                      image: AssetImage("assets/images/courseUpdate.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Course Updates",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),



              SizedBox(height: height*0.05),

              //Examination
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsExaminationSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF244462),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/examination.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Examination                 ",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),


              SizedBox(height: height*0.05),

              //Notices
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsNoticeSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF8ECEFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/notice.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Notices                 ",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),


              SizedBox(height: height*0.05),

              //Teacher Interaction
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParentsInteractionSection()),
                ),
                child: Container(
                  height: 230,
                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF244462),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/facultyInteraction.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Teacher Interaction",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),


              SizedBox(height: height*0.05),






            ],
          ),
        )

    ),
    );
  }
}
