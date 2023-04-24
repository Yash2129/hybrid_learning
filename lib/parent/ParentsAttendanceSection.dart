import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
class ParentsAttendanceSection extends StatefulWidget {
  const ParentsAttendanceSection({Key? key}) : super(key: key);

  @override
  State<ParentsAttendanceSection> createState() => _ParentsAttendanceSectionState();
}

class _ParentsAttendanceSectionState extends State<ParentsAttendanceSection> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Present": 5,
      "Absent": 3,
    };
    return Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 30,bottom: 20),
              child: const Text("Attendance",
                style: TextStyle(
                    fontFamily: 'Quicksand_Bold',
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF244462),
                    fontSize: 30),),
            ),

            const SizedBox(
              height: 40,
            ),
            PieChart(
              dataMap: dataMap,
              animationDuration: const Duration(milliseconds: 800),
              chartLegendSpacing: 30,
              chartRadius: MediaQuery.of(context).size.width / 1.5,
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 60,
              centerText: "Attendance",
              legendOptions: const LegendOptions(
                showLegendsInRow: false,
                legendPosition: LegendPosition.bottom,
                showLegends: true,
                legendShape: BoxShape.circle,
                legendTextStyle: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Quicksand_Bold',
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF244462),),
              ),
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: false,
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: false,
                decimalPlaces: 1,
              ),
              // gradientList: ---To add gradient colors---
              // emptyColorGradient: ---Empty Color gradient---
            ),

            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(width: 20,),
                Card(
                  color: Colors.green,
                  margin: const EdgeInsets.only(top: 20),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    height: 50,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text("Present: 5",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand_Bold'),),),

                ),
                const SizedBox(width: 45,),
                Card(
                  color: Colors.red,
                  margin: const EdgeInsets.only(top: 20),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 150,
                    child: const Text("Absent: 3",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand_Bold'),),),

                ),
              ],
            ),
            const SizedBox(height: 45,),
            Card(
              color: Colors.white70,
              margin: const EdgeInsets.only(top: 20),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Container(
                height: 50,
                width: 200,
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: const Text("Total Lectures: 8",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand_Bold'),),),

            ),
          ],
        )

    );
  }
}
