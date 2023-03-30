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
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref,
                  itemBuilder: (context, snapshot, animation, index){
                    return ListTile(
                      title:Text(snapshot.key.toString()),
                      subtitle: Text(snapshot.value.toString()),
                    );


                  })
          ),

        ],
      ),
    );
  }
}
