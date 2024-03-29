import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hybrid_learning_application/student/StudentAttendanceSection.dart';
import 'package:hybrid_learning_application/student/StudentCourseSection.dart';
import 'package:hybrid_learning_application/student/StudentExaminationSection.dart';
import 'package:hybrid_learning_application/student/StudentNoticeSection.dart';
import 'package:hybrid_learning_application/student/StudentOnlineResources.dart';
import 'package:hybrid_learning_application/student/StudentProfileView.dart';


class StudentMainScreen extends StatefulWidget {
  const StudentMainScreen({Key? key}) : super(key: key);

  @override
  State<StudentMainScreen> createState() => _StudentMainScreenState();
}

class _StudentMainScreenState extends State<StudentMainScreen> {

  final user = FirebaseAuth.instance.currentUser;
  String name = '';
  late String uid;


  @override
  Widget build(BuildContext context) {

    DateTime pre_backpress = DateTime.now();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = this.user;
    if (user != null) {
      uid = user.uid;
    }
    final r = FirebaseDatabase.instance.ref('Profiles').child(uid).child('StudentName');
    r.once().then((DatabaseEvent event){
      name = event.snapshot.value.toString();
    });



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
    child: Scaffold(
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
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50)
                  )

                ),
                child: Stack(
                  children: [

                    InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentProfileView()),
                      ),
                      child: Container(

                          alignment: Alignment.topRight,

                          padding: const EdgeInsets.only(right: 30,top: 30),
                          child: const Icon(Icons.account_circle,size: 30,color: Colors.white),
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
                          width: 310,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50)
                            )
                          ),
                    )),

                    Positioned(
                        top: 70,
                        left: 10,

                        child: Text('Welcome\n$name',
                            style: const TextStyle(
                                fontFamily: 'Quicksand_Bold',
                                fontWeight: FontWeight.w900,
                                color: Color(0xFF244462),
                                fontSize: 26)
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
                  MaterialPageRoute(builder: (context) => const StudentAttendanceSection()),
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

              //Course Updates
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentCourseSection()),
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
                    MaterialPageRoute(builder: (context) => const StudentExaminationSection()),
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
                  MaterialPageRoute(builder: (context) => const StudentNoticeSection()),
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

              //Online Resources
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentOnlineResources()),
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
                                      image: AssetImage("assets/images/onlineResource.png")
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
                            child: const Text("Online Resources",
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

              //Faculty Feedback




            ],
          ),
        )
    ),
    );


  }
}



