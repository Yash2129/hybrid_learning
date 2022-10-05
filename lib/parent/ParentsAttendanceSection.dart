import 'package:flutter/material.dart';

class ParentsAttendanceSection extends StatefulWidget {
  const ParentsAttendanceSection({Key? key}) : super(key: key);

  @override
  State<ParentsAttendanceSection> createState() => _ParentsAttendanceSectionState();
}

class _ParentsAttendanceSectionState extends State<ParentsAttendanceSection> {
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
