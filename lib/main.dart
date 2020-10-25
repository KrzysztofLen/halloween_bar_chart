import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halloween_chart/widgets/halloween_bar_chart.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFEB6123),
        accentColor: Color(0xFF5E32BA),
        hintColor: Color(0xFF96C457),
        primaryColorDark: Color(0xFF18181A),
        fontFamily: 'fofbb_reg',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Halloween chart',
          ),
        ),
        body: AbsorbPointer(
          absorbing: true,
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(15),
            child: HalloweenBarChart.withSampleData(),
          ),
        ),
      ),
    );
  }
}

