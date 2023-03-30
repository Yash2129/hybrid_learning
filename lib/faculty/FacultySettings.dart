import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/faculty/FacultyProfileView.dart';

class FacultySettings extends StatefulWidget {
  const FacultySettings({Key? key}) : super(key: key);

  @override
  State<FacultySettings> createState() => _FacultySettingsState();
}

class _FacultySettingsState extends State<FacultySettings> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    Future<void> _signOut() async {
      await _auth.signOut();
    }

    return Scaffold(
      body: Column(
        children: [
      Container(
      padding: const EdgeInsets.only(top: 410),
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

            'Profile',textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold',)
        ),
        onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> FacultyProfileView()));
          },
      ),
    ), SizedBox(
            width: 30,
            height: 30,
          ),
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
