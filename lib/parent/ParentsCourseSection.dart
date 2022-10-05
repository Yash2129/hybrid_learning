import 'package:flutter/material.dart';

class ParentsCourseSection extends StatefulWidget {
  const ParentsCourseSection({Key? key}) : super(key: key);

  @override
  State<ParentsCourseSection> createState() => _ParentsCourseSectionState();
}

class _ParentsCourseSectionState extends State<ParentsCourseSection> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[

              Container(
                padding: EdgeInsets.only(left: 10,top: 10),
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios,size: 30),
              ),


              //BOX names
              SizedBox(height: height*0.03),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                height: height*0.09 ,
                width: width*0.9,
                decoration: BoxDecoration(
                    color: Color(0xFF8ECEFF),
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Text('Subject',style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: height*0.05),

            ]
        ),

      ),
    );
  }
}
