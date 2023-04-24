import 'package:firebase_database/firebase_database.dart';
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
    late var time;
    TextEditingController _textupdatecontroller=TextEditingController();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, left: 30,bottom: 20),
            child: const Text("Notice Upload",
              style: TextStyle(
            fontFamily: 'Quicksand_Bold',
            fontWeight: FontWeight.w900,
            color: Color(0xFF244462),
            fontSize: 30),),
          ),
          Container(
            padding: EdgeInsets.only(top: 20, left: 30,right: 30),
            child: TextFormField(
              controller: _textupdatecontroller,
              minLines: 2,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter Notice',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),

          Container(
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
                  'Upload',
                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
              ),
              onPressed: () async{
                String text=_textupdatecontroller.text;
                 FirebaseDatabase database = FirebaseDatabase.instance;
                DatabaseReference ref = database.ref("Notices");
                time=DateTime.now();
                String branch='$time';
                String a=branch.substring(0,16);
                await ref.child(a).set({
                  "Text": text,
                });
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uploaded")));





              },
            ),
          ),





        ],
      )
    );
  }
}
