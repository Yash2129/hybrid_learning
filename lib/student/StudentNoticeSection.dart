import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class StudentNoticeSection extends StatefulWidget {
  const StudentNoticeSection({Key? key}) : super(key: key);

  @override
  State<StudentNoticeSection> createState() => _StudentNoticeSectionState();
}

class _StudentNoticeSectionState extends State<StudentNoticeSection> {

  final ref=FirebaseDatabase.instance.ref('Notices');
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: Column(
        children: [
          SizedBox(
            height: 50,
            width: 30,
          ),
          Container(
              height: height*0.1,
              width: width*0.9,
              child: const Text('Notices',
                style: TextStyle(
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                    fontSize: 30),)
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index){
                    return ListTile(
                      subtitle:Text(snapshot.key.toString(),
                        style: const TextStyle(
                            fontFamily: 'Quicksand_Bold',
                            fontWeight: FontWeight.w200,
                            color: Color(0xFF244462),
                            fontSize: 16),),
                      title: Text(snapshot.value.toString(),
                        style: const TextStyle(
                            fontFamily: 'Quicksand_Bold',
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF244462),
                            fontSize: 22),),
                    );


                  })
          ),

        ],
      ),

    );
  }
}
