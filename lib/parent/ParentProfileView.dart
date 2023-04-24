import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class ParentProfileView extends StatefulWidget {
  const ParentProfileView({Key? key}) : super(key: key);

  @override
  State<ParentProfileView> createState() => _ParentProfileViewState();
}

class _ParentProfileViewState extends State<ParentProfileView> {
  final user = FirebaseAuth.instance.currentUser;
  String name = '';
  String rollNo = '';
  String classDiv = '';
  String collegeId = '';
  String emailId = '';
  String password = '';
  late String uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    Future<void> _signOut() async {
      await _auth.signOut();
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = this.user;
    if (user != null) {
      uid = user.uid;

    }
    final r = FirebaseDatabase.instance.ref('Profiles').child(uid).child('ParentName');
    r.once().then((DatabaseEvent event){
      name = event.snapshot.value.toString();
    });
    final r2 = FirebaseDatabase.instance.ref('Profiles').child(uid).child('StudentRollNo');
    r2.once().then((DatabaseEvent event){
      rollNo = event.snapshot.value.toString();
    });
    final r3 = FirebaseDatabase.instance.ref('Profiles').child(uid).child('Class');
    r3.once().then((DatabaseEvent event){
      classDiv = event.snapshot.value.toString();
    });
    final r4 = FirebaseDatabase.instance.ref('Profiles').child(uid).child('StudentCollegeId');
    r4.once().then((DatabaseEvent event){
      collegeId = event.snapshot.value.toString();
    });
    final r5 = FirebaseDatabase.instance.ref('Profiles').child(uid).child('email');
    r5.once().then((DatabaseEvent event){
      emailId = event.snapshot.value.toString();
    });
    final r6 = FirebaseDatabase.instance.ref('Profiles').child(uid).child('password');
    r6.once().then((DatabaseEvent event){
      password = event.snapshot.value.toString();
    });


    return Scaffold(
      body: Column(
        children: [
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
                    left: 20,

                    child: Text('Parent Profile',
                        style: TextStyle(
                            fontFamily: 'Quicksand_Bold',
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF244462),
                            fontSize: 30)
                    )
                )
              ],
            ),
          ),
          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 50,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("Name: $name",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),

          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 50,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("Roll Number: $rollNo",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),



          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 50,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("Class: $classDiv",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),

          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 50,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("College Id: $collegeId",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),

          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 80,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("Email Id: $emailId",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),

          Card(
            color: Colors.white70,
            margin: const EdgeInsets.only(top: 20),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              width: width*0.9,
              height: 50,
              padding: EdgeInsets.only(top: 10,left: 10),
              child: Text("Password: $password",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Quicksand_Bold'),),),

          ),

          SizedBox(height: height*0.05),
          Container(
            color: Colors.white,
            alignment: Alignment.topCenter,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  elevation: 6,
                  padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                  backgroundColor: const Color(0xFF0090FF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text(

                  'Logout',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold',)
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.popUntil(context, ModalRoute.withName('loginOptions'));
              },
            ),
          ),


        ],
      ),

    );
  }
}
