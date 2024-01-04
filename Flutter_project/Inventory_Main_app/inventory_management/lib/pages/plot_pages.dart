import 'package:flutter/material.dart';
import 'package:inventory_management/bar graph/bar_graph.dart';


class Plots extends StatefulWidget {
  final List<double> acMonthly;

  const Plots({super.key, required this.acMonthly});

  @override
  // ignore: no_logic_in_create_state
  State<Plots> createState() => _PlotsState(acMonthly: acMonthly);
}

class _PlotsState extends State<Plots> {
  List<double> acMonthly;

  _PlotsState({required this.acMonthly});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // To make the AppBar transparent
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,

      // AppBar 
      appBar: AppBar( 
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Monthly Power Generation',
        style: TextStyle(color: Colors.white),),

        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey.shade200,
            height: 1.0,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),

    body: Center(
      child: SizedBox(
        height: 500,
        child: MyBarGraph(acMonthly: acMonthly),
        )
    ),
  );
  }
  
}