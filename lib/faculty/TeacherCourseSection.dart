import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class TeacherCourseSection extends StatefulWidget {
  const TeacherCourseSection({Key? key}) : super(key: key);

  @override
  State<TeacherCourseSection> createState() => _TeacherCourseSectionState();
}

class _TeacherCourseSectionState extends State<TeacherCourseSection> {

  final List<String> Year=['FE','SE','TE','BE'];
  final List<String> FEsub=['EM1','Physics'];
  final List<String> SEsub=['DS','AOA'];
  final List<String> TEsub=['AI','CSS'];
  final List<String> BEsub=['ML','NLP'];

  late var y;
  late var s;

  String selectedYear='FE';
  String selectedSubejct='EM1';
  List<String> sub=[];
  _subDependentDropDown(year)
  {
    if(year=='FE'){
      sub=FEsub;
    }else if(year=='SE')
      {
        sub=SEsub;
      }
    else if(year=='TE')
    {
      sub=TEsub;
    }
    else
      {
        sub=BEsub;
      }
    selectedSubejct=sub.first.toString();

  }
  @override

  Widget build(BuildContext context) {

    TextEditingController _textupdatecontroller=TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Text("Year"),
              SizedBox(
                width: 30,
                height: 30,
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                value:selectedYear,
                items: Year.map((e){
                      return DropdownMenuItem<String>(
                        value: e,
                        child: Text('$e'),
                      );
                }).toList(),
                onChanged: (newValueSelected){
                  setState(() {
                    _subDependentDropDown(newValueSelected);
                      selectedYear = "$newValueSelected";
                      y=newValueSelected;
                  });
                },
              ),

              //Subject

              SizedBox(
                width: 30,
                height: 30,
              ),
              Text("Subject"),
              SizedBox(
                width: 30,
                height: 30,
              ),
              DropdownButton<String>(
                alignment: Alignment.center,
                value:selectedSubejct,
                items: sub.map((e){
                  return DropdownMenuItem<String>(
                    value: e,
                    child: Text('$e'),
                  );
                }).toList(),
                onChanged: (String? newValueSelected){
                  setState(() {
                    selectedSubejct = newValueSelected!;
                    s=newValueSelected;
                  });
                },
              ),
            ],
          ),

          TextFormField(
            controller: _textupdatecontroller,
            minLines: 2,
            maxLines: 100,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: 'Enter Course Update here',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
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
                var year=y;
                var subject=s;

                  /* FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value){
                          FirebaseFirestore.instance.collection('Faculty').doc(value.user?.uid).set({"FacultyName":_fullNameController.text,"email": value.user?.email, "password": _passwordController.text, "CollegeId": _idController.text});*/
                  FirebaseDatabase database = FirebaseDatabase.instance;
                  DatabaseReference ref = database.ref("Subjects");
                  DatabaseReference child1 = ref.child(year);
                    await child1.child(subject).set({
                      "Text": text,
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uploaded")));





              },
            ),
          ),





        ],
      ),

    );

  }
}
