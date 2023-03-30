import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
class SubjectScreen extends StatefulWidget {
  final String classDiv;
  const SubjectScreen({Key? key,required this.classDiv}) : super(key: key);


  @override
  // ignore: no_logic_in_create_state
  State<SubjectScreen> createState() => _SubjectScreenState(classDiv: classDiv);
}

class _SubjectScreenState extends State<SubjectScreen> {
  late String classDiv;
  _SubjectScreenState({required this.classDiv});
  final cbox=CheckBoxModel();
  bool value=false;
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = database.ref("Students").child(classDiv);
   // DatabaseReference child1 = ref.child(classDiv);
    //final snapshot = child1.get();
    return Scaffold(
      body: Column(
          children: [
            ListTile(
              leading: Checkbox(
                value: value,
                onChanged: (value) => setState(() => this.value= value!),
              ),
              title: Text(ref.key.toString()),
            ),

            Expanded(
                child: FirebaseAnimatedList(
                    query: ref,
                    itemBuilder: (context, snapshot, animation, index){
                      return ListTile(
                       onTap: () =>onItemClick(cbox),

                        leading: Checkbox(
                          value: cbox.value,
                          onChanged: (value) => onItemClick(cbox),
                        ),
                        title: Text(snapshot.key.toString()),
                      );


                    })
            )

          ]

      ),
    );

  }

  onItemClick(CheckBoxModel cbitem)
  {
    final newValue=!cbitem.value;
    final title=cbitem.title;
    setState(() {
      if(cbitem.title==title) {
        cbitem.value = newValue;
      }
      else
        {
          cbitem.value=false;
        }
      /*if(!newValue){
        /*if all list checkbox not full check then
         no need for checking allcheck box*/
        cbox.value=false;
      }else{
        /* If all check box are checked then need to
        check allcheck box*/
        final allListChecked= checkBoxList.every((element) => element.value);
        cbox.value=allListChecked;
      }*/

    });
  }
}
class CheckBoxModel{
  late String title;
  late bool value;

  CheckBoxModel({this.title="", this.value =false});
}
