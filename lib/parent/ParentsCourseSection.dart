import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ParentsCourseSection extends StatefulWidget {
  const ParentsCourseSection({Key? key}) : super(key: key);

  @override
  State<ParentsCourseSection> createState() => _ParentsCourseSectionState();
}

class _ParentsCourseSectionState extends State<ParentsCourseSection> {
  final user = FirebaseAuth.instance.currentUser;

  late String uid;
  final ref=FirebaseDatabase.instance.ref('Subjects');

  late String year;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = this.user;
    if (user != null) {
      uid = user.uid;
    }

    //Reading class value from realtime database

    final r=FirebaseDatabase.instance.ref('Profiles').child(uid).child('Class');
    r.once().then((DatabaseEvent event) {
      //print('Data : ${event.snapshot.value}');
      String y = event.snapshot.value.toString();
      String yr = y.substring(0, 2);
      setState(() {
        year=yr;
      });
    });




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
            child: const Text('Course Update',
              style: TextStyle(
                  fontFamily: 'Quicksand_Bold',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF244462),
                  fontSize: 30),)
          ),
          Expanded(
              child: FirebaseAnimatedList(
                  query: ref.child(year),
                  itemBuilder: (context, snapshot, animation, index){
                    return ListTile(
                      title:Text(snapshot.key.toString(),
                        style: const TextStyle(
                          fontFamily: 'Quicksand_Bold',
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF244462),
                          fontSize: 18),),
                      subtitle: Text(snapshot.value.toString(),
                        style: const TextStyle(
                            fontFamily: 'Quicksand_Bold',
                            fontWeight: FontWeight.w200,
                            color: Color(0xFF244462),
                            fontSize: 16),),
                    );


                  })
          ),

        ],
      ),

    );
  }
}
