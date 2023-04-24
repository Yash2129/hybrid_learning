import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';


class StudentOnlineResources extends StatefulWidget {
  const StudentOnlineResources({Key? key}) : super(key: key);

  @override
  State<StudentOnlineResources> createState() => _StudentOnlineResourcesState();
}

class _StudentOnlineResourcesState extends State<StudentOnlineResources> {


  Future<ListResult>? futureFiles;
  Map<int,double> downloadProgress={};

  final user = FirebaseAuth.instance.currentUser;

  late String uid;
  final ref=FirebaseDatabase.instance.ref('Subjects');
  String year='';


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
    setState(() {
      futureFiles = FirebaseStorage.instance.ref('/$year').listAll();
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Download Files'),
      ),
      body: FutureBuilder<ListResult>(
        future: futureFiles,
        builder: (context,snapshot) {
          if(snapshot.hasData){
            final files=snapshot.data!.items;

            return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context,index){
                  final file=files[index];
                  double? progress =downloadProgress[index];

                  return ListTile(
                    title: Text(file.name),
                    subtitle: progress!=null
                        ? LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.black26,
                    )
                        :null,
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.download,
                        color: Colors.black,
                      ),
                      onPressed: () => downloadFile(index,file),
                    ),
                  );

                }
            );


          } else if(snapshot.hasError){
            return const Center(child: Text('Error occurred'));
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );

  }
  Future downloadFile(int index,Reference ref) async{
    //Not visible to user


    final url= await ref.getDownloadURL();
    final tempDir = await getTemporaryDirectory();
    final path='${tempDir.path}/${ref.name}';
    await Dio().download(
        url,
        path,
        onReceiveProgress: (received,total){
          double progress=  received/total;
          setState(() {
            downloadProgress[index] =progress;
          });
        }
    );

    if(url.contains('.jpg')){
      await GallerySaver.saveImage(path,toDcim: true);
    }else if(url.contains('.mp4')){
      await GallerySaver.saveVideo(path,toDcim: true);
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Downloaded ${ref.name}')),
    );
  }
}
