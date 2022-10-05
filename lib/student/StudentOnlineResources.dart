import 'package:flutter/material.dart';

class StudentOnlineResources extends StatefulWidget {
  const StudentOnlineResources({Key? key}) : super(key: key);

  @override
  State<StudentOnlineResources> createState() => _StudentOnlineResourcesState();
}

class _StudentOnlineResourcesState extends State<StudentOnlineResources> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                padding: EdgeInsets.only(left: 10,top: 10),
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back_ios,size: 30),
              ),


              //BOX names
              SizedBox(height: height*0.03),
              //E Notes
              InkWell(

                child: Container(
                  height: 230,

                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF8ECEFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/eNotes.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("E-Notes               ",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),

              SizedBox(height: height*0.05),


              //E Books
              InkWell(

                child: Container(
                  height: 230,

                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF244462),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/eBooks.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("E-Books                ",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),


              SizedBox(height: height*0.05),



              //Recorded Lectures
              InkWell(

                child: Container(
                  height: 230,

                  child: Stack(
                    children: [
                      Positioned(top:35,left:20,child: Material(
                        child: Container(
                          height: 180.0,
                          width: width*0.9,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(0.0),
                              boxShadow: [BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20,
                                  spreadRadius: 4.0,
                                  offset: const Offset(-10,10)
                              )]
                          ),

                        ),
                      )),

                      Positioned(
                          top: 0,
                          left: 30,
                          child: Card(

                            elevation: 10,
                            shadowColor: Colors.grey.withOpacity(0.6),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Container(
                              height: 200,
                              width: 150,

                              decoration: BoxDecoration(
                                  color: Color(0xFF8ECEFF),
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      fit: BoxFit.contain,
                                      image: AssetImage("assets/images/recordedLectures.png")
                                  )
                              ),
                            ),
                          )

                      ),


                      Positioned(
                          top: 40,
                          left: 160,
                          child: Container(
                            height: 180,
                            width: 200,
                            padding: EdgeInsets.only(left: 40),
                            alignment: Alignment.center,
                            child: const Text("Recorded Lectures",
                              style: TextStyle(
                                  color: Color(0xFF244462),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand_Bold'),),
                          )
                      )


                    ],
                  ),
                ),
              ),


              SizedBox(height: height*0.05),




            ],
          ),
        )

    );
  }
}
