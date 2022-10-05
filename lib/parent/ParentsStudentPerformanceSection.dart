import 'package:flutter/material.dart';

class ParentsStudentPerformanceSection extends StatefulWidget {
  const ParentsStudentPerformanceSection({Key? key}) : super(key: key);

  @override
  State<ParentsStudentPerformanceSection> createState() => _ParentsStudentPerformanceSectionState();
}

class _ParentsStudentPerformanceSectionState extends State<ParentsStudentPerformanceSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Text('Here Data Will Be Updated From Database',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w900,
        fontFamily: 'Quicksand_Bold'
      ),
      ),
    );
  }
}
