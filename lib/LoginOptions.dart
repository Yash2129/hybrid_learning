import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/faculty/FacultyLogin.dart';
import 'package:hybrid_learning_application/parent/ParentLogin.dart';
import 'package:hybrid_learning_application/student/StudentLogin.dart';

class LoginOptions extends StatefulWidget {
  const LoginOptions({Key? key}) : super(key: key);

  @override
  State<LoginOptions> createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/loginbg.png'),filterQuality: FilterQuality.high,fit: BoxFit.cover)),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(

          children: [

            Container(
              padding: const EdgeInsets.only(left: 15,top: 310),
              child: const Text('Welcome',style: TextStyle(
                color: Colors.black,
                fontSize: 33,
                fontWeight: FontWeight.w900,
                fontFamily: 'Quicksand_Bold'
              ),),
            ),


            Container(
              padding: const EdgeInsets.only(top: 410),
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    backgroundColor: const Color(0xFF0090FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(

                  'Student Login',textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold',)
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StudentLogin()),
                  );
                },
              ),
            ),


            Container(
              padding: const EdgeInsets.only(top: 510),
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    backgroundColor: const Color(0xFF0090FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(

                    'Parents Login',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ParentsLogin()),
                  );
                },
              ),
            ),


            Container(
              padding: const EdgeInsets.only(top: 610),
              alignment: Alignment.topCenter,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    elevation: 6,
                    padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12),
                    backgroundColor: const Color(0xFF0090FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: const Text(

                    'Faculty Login',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FacultyLogin()),
                  );
                },
              ),
            ),

          ],
        ),
      ),

    );

  }
}
