import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hybrid_learning_application/faculty/FacultyMainScreen.dart';
import 'package:hybrid_learning_application/faculty/FacultyRegistration.dart';

class FacultyLogin extends StatefulWidget {
  const FacultyLogin({Key? key}) : super(key: key);

  @override
  State<FacultyLogin> createState() => _FacultyLoginState();
}

class _FacultyLoginState extends State<FacultyLogin> {
  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return FacultyLoginScreen();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}


class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({Key? key}) : super(key: key);

  @override
  State<FacultyLoginScreen> createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {


  static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{


    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("Invalid User");
      }
    }

    return user;
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();



    return Container(

      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/facultyLogin.png'),filterQuality: FilterQuality.high,fit: BoxFit.cover)),


      child: Scaffold(
          backgroundColor: Colors.transparent,

          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 140),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 20, top: 190),
                  child: const Text('Faculty Login',style: TextStyle(
                      color: Colors.black,
                      fontSize: 33,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Quicksand_Bold'
                  ),),
                ),

                Container(

                  padding: const EdgeInsets.only(left: 25,right: 25,top: 30,bottom: 10),
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

                      prefixIcon: Icon(Icons.account_box),
                      hintText: "UserName",
                      filled: true,
                      fillColor: Colors.white,

                    ),
                  ),
                ),


                Container(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 30,bottom: 5),
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
                  padding: const EdgeInsets.only(bottom: 10,top: 5,right: 30),
                  alignment: Alignment.bottomRight,
                  child: const Text('Forgot Password?',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Quicksand_Bold'
                  ),),
                ),


                Container(
                  padding: const EdgeInsets.only(top: 40),
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

                        'SIGN IN',
                        style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                    ),
                    onPressed: () async{
                      User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                      String email = _emailController.text;
                      var gmail = email.split('@');
                      bool found = gmail[0].contains(RegExp(r'[0-9]'));
                      if(user!=null && found==false){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>  FacultyMainScreen()));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Enter Valid UserName")));
                      }
                    },
                  ),
                ),


                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(top: 20),
                    child: const Text('Do not have an account? Register',style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w100,
                        fontFamily: 'Quicksand_Bold'
                    ),),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const FacultyRegistration()));
                  },
                )
              ],
            ),
          )

      ),
    );
  }
}
