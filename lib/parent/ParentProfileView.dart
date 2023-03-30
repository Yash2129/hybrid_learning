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

  late String uid;
  final ref=FirebaseDatabase.instance.ref('Profiles');
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = this.user;
    if (user != null) {
      uid = user.uid;
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance.ref('Profiles').child(uid),
                  itemBuilder: (context, snapshot, animation, index){
                    return ListTile(
                      title:Text(snapshot.key.toString()),
                      subtitle: Text(snapshot.value.toString()),
                    );


                  })
          )

        ],
      ),

    );
  }
}
