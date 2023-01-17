import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/parent/ParentLogin.dart';

class ParentsRegistration extends StatefulWidget {
  const ParentsRegistration({Key? key}) : super(key: key);

  @override
  State<ParentsRegistration> createState() => _ParentsRegistrationState();
}

class _ParentsRegistrationState extends State<ParentsRegistration> {
  @override
  Widget build(BuildContext context) {
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref("Parents");
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _fullNameController = TextEditingController();
    TextEditingController _classController = TextEditingController();
    TextEditingController _idController = TextEditingController();
    TextEditingController _rollNoController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();
    return Container(

      color: Colors.white,


      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 10),
                  child: const Text('Parent Registration',style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Quicksand_Bold'
                  ),),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 25,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _fullNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.abc_sharp),
                      hintText: "Full Name",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),




                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _idController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.school),
                      hintText: "College ID",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _rollNoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.numbers),
                      hintText: "Roll Number",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(

                    controller: _classController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.account_balance_sharp),
                      hintText: "Class (Example: BE-A)",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: "Email",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),

                      prefixIcon: Icon(Icons.lock),

                      hintText: "Password",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 20,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [BoxShadow(
                          color: Color(0xFFE3E3E3),
                          blurRadius: 40,
                          offset: Offset(0,20)
                      )]
                  ),
                  child: TextField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,

                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x80E3E3E3)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      hintText: "Confirm Password",
                      filled: true,
                      fillColor: Colors.white,

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

                        'Register',
                        style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                    ),
                    onPressed: () async{

                      String email = _emailController.text;
                      var gmail = email.split('@');
                      var classDiv = _classController.text;
                      DatabaseReference child1 = ref.child(classDiv);
                      var rollno = _rollNoController.text;

                      if(gmail[1]=='gmail.com'){
                        FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) async {

                          await child1.child(rollno).set({
                            "ParentName":_fullNameController.text,
                            "email": _emailController.text,
                            "password": _passwordController.text,
                            "StudentCollegeId": _idController.text,
                            "StudentRollNo": _rollNoController.text,
                            "UID": value.user?.uid
                          });
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> ParentsLogin()));
                        });
                      }

                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Valid Email Id")));
                      }

                    },
                  ),
                ),




              ],
            ),
          )

      ),
    );
  }
}
