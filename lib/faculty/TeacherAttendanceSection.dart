import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/faculty/SubjectScreen.dart';

import 'FacultyRegistration.dart';

class TeacherAttendanceSection extends StatefulWidget {
  const TeacherAttendanceSection({Key? key}) : super(key: key);

  @override
  State<TeacherAttendanceSection> createState() => _TeacherAttendanceSectionState();
}


class _TeacherAttendanceSectionState extends State<TeacherAttendanceSection> {



  final ref=FirebaseDatabase.instance.ref('Students');
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (context, snapshot, animation, index){
                  return InkWell(
                    onTap: () =>

                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SubjectScreen(classDiv: snapshot.key.toString()))),

                    child:
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20, left: 30, right: 20),
                      padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                      height: height*0.09,
                      width: width*0.9,
                      decoration: BoxDecoration(
                          color: Color(0xFF8ECEFF),
                          borderRadius: BorderRadius.circular(15)
                      ),

                      child: Text(
                        snapshot.key.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Quicksand_Bold',
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF244462),),
                      ),
                    ),



                  );


                })
          )

        ]

      ),
      );

  }
}
class CheckBoxModel{
  late String title;
  late bool value;

  CheckBoxModel({required this.title, this.value =false});
}
