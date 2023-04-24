
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class TeacherOnlineResources extends StatefulWidget {
  const TeacherOnlineResources({Key? key}) : super(key: key);

  @override
  State<TeacherOnlineResources> createState() => _TeacherOnlineResourcesState();
}

class _TeacherOnlineResourcesState extends State<TeacherOnlineResources> {

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
  PlatformFile? pickedFile;
  UploadTask? uploadTask;
  Future pickFile() async
  {
    final result=await FilePicker.platform.pickFiles();
    if(result==null) return;
    setState(() {
      pickedFile=result.files.first;
    });

  }
  uploadFile() async
  {

    final path='${selectedYear}/${pickedFile!.name}';
    final file= File(pickedFile!.path!);

    final ref=FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
    setState(() {
      pickedFile=null;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Uploaded")));


  }


  @override
  Widget build(BuildContext context) {


    TextEditingController _textupdatecontroller=TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, left: 30,bottom: 20),
              child: const Text("Online Resource Upload",
                style: TextStyle(
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                    fontSize: 30),),
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: 65,
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Year",
                    style: TextStyle(
                        fontFamily: 'Quicksand_Bold',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF244462),
                        fontSize: 16),),
                ),
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
                      child: Text('$e',
                        style: TextStyle(
                            fontFamily: 'Quicksand_Bold',
                            fontWeight: FontWeight.w100,
                            color: Color(0xFF244462),
                            fontSize: 16),),
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
                Container(
                  height: 30,
                  width: 85,
                  padding: EdgeInsets.only(left: 20),
                  child: Text("Subject",
                    style: TextStyle(
                        fontFamily: 'Quicksand_Bold',
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF244462),
                        fontSize: 16),),
                ),
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
                      child: Text('$e',style: TextStyle(
                          fontFamily: 'Quicksand_Bold',
                          fontWeight: FontWeight.w100,
                          color: Color(0xFF244462),
                          fontSize: 16),),
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
            if(pickedFile!=null)
              Expanded(
                  child: Container(
                    color: Colors.blue[100],
                    child: Center(
                      child: Text(pickedFile!.name),
                    ),
                  )
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
    onPressed: () {  },
    child: const Text(
    'Select File',
    style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
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
                onPressed: () {
                  uploadFile();
                },
                child: const Text(
                    'Upload File',
                    style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'Quicksand_Bold')
                ),
              ),
            ),
          ],
        )

    );
  }
}
