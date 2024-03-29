import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ParentsNoticeSection extends StatefulWidget {
  const ParentsNoticeSection({Key? key}) : super(key: key);

  @override
  State<ParentsNoticeSection> createState() => _ParentsNoticeSectionState();
}

class _ParentsNoticeSectionState extends State<ParentsNoticeSection> {
  @override
  final ref=FirebaseDatabase.instance.ref('Notices');
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
