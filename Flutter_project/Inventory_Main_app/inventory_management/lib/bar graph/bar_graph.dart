import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/bar graph/bar_data.dart';

class MyBarGraph extends StatelessWidget{
  final List<double> acMonthly;
  const MyBarGraph({super.key, required this.acMonthly});

  MaterialColor colorSelection(double value) {
    if(value > 10000)
    {
      return Colors.green;
    }
    else if( value > 5000 && value < 10000) {
      return Colors.lime;
    }
    else if (value > 3000 && value < 5000) {
      return Colors.yellow;
    }
    else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    // initialize bar data
    MyBarData mybarData = MyBarData(
      janAc: acMonthly[0],
      febAc: acMonthly[1],
      marAc: acMonthly[2],
      aprAc: acMonthly[3],
      mayAc: acMonthly[4],
      junAc: acMonthly[5],
      julAc: acMonthly[6],
      augAc: acMonthly[7],
      sepAc: acMonthly[8],
      octAc: acMonthly[9],
      novAc: acMonthly[10],
      decAc: acMonthly[11],
    );
    mybarData.initializeBarData();

    return BarChart(
      BarChartData(
        minY: 0,
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          show:true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: getsideTitles)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget:getBottomTitles)),
        ),
        barGroups: mybarData.barData
        .map((data) => BarChartGroupData(
          x: data.x,
          barRods: [
            BarChartRodData(
              toY: data.y,
              width: 20,
              color: colorSelection(data.y), 
              borderRadius: BorderRadius.circular(4)),
           
          ]))
        .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );

  Widget text;
  switch(value.toInt()) {
    case 0:
    text = const Text('Jan', style: style);
    break;
    case 1:
    text = const Text('Feb', style: style);
    break;
    case 2:
    text = const Text('Mar', style: style);
    break;
    case 3:
    text = const Text('Apr', style: style);
    break;
    case 4:
    text = const Text('May', style: style);
    break;
    case 5:
    text = const Text('Jun', style: style);
    break;
    case 6:
    text = const Text('Jul', style: style);
    break;
    case 7:
    text = const Text('Aug', style: style);
    break;
    case 8:
    text = const Text('Sep', style: style);
    break;
    case 9:
    text = const Text('Oct', style: style);
    break;
    case 10:
    text = const Text('Nov', style: style);
    break;
    case 11:
    text = const Text('Dec', style: style);
    break;
    default:
    text = const Text('', style: style);
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);

}

Widget getsideTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.normal,
    fontSize: 8.5,
  );

  Widget text;
  value /= 1000;
  int valueInt = value.toInt();
  String valueString = valueInt.toString();
  text = Text('${valueString}K', style: style);

  return SideTitleWidget(axisSide: meta.axisSide, child: text);

}