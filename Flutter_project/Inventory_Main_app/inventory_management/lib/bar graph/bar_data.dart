import 'package:inventory_management/bar graph/individual_bar.dart';

class MyBarData {
  final double janAc;
  final double febAc;
  final double marAc;
  final double aprAc;
  final double mayAc;
  final double junAc;
  final double julAc;
  final double augAc;
  final double sepAc;
  final double octAc;
  final double novAc;
  final double decAc;

  MyBarData({
    required this. janAc,
    required this. febAc,
    required this. marAc,
    required this. aprAc,
    required this. mayAc,
    required this. junAc,
    required this. julAc,
    required this. augAc,
    required this. sepAc,
    required this. octAc,
    required this. novAc,
    required this. decAc,
  });

  List<IndividualBar> barData = [];

  // initialize the bar data
  void initializeBarData() {
    barData = [
      // Jan
      IndividualBar(x: 0, y: janAc),
      // Feb
      IndividualBar(x: 1, y: febAc),
      // Mar
      IndividualBar(x: 2, y: marAc),
      // Apr
      IndividualBar(x: 3, y: aprAc),
      // May
      IndividualBar(x: 4, y: mayAc),
      // June
      IndividualBar(x: 5, y: junAc),
      // July
      IndividualBar(x: 6, y: julAc),
      // Aug
      IndividualBar(x: 7, y: augAc),
      // Sep
      IndividualBar(x: 8, y: sepAc),
      // Oct
      IndividualBar(x: 9, y: octAc),
      // Nov
      IndividualBar(x: 10, y: novAc),
      // Dec
      IndividualBar(x: 11, y: decAc),
    ];
  }

}