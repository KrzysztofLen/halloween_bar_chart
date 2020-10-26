import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:halloween_chart/models/scary_statistics.dart';

class HalloweenBarChart extends StatelessWidget {
  final List<Series> seriesList;
  final bool animate;

  HalloweenBarChart(this.seriesList, {this.animate});

  factory HalloweenBarChart.withSampleData() {
    return HalloweenBarChart(_createSampleData(), animate: false);
  }

  static List<Series<ScaryStatics, String>> _createSampleData() {
    final data = [
      ScaryStatics(1, 11),
      ScaryStatics(2, 14),
      ScaryStatics(3, 8),
      ScaryStatics(4, 10),
      ScaryStatics(5, 15),
      ScaryStatics(6, 1),
      ScaryStatics(7, 9),
      ScaryStatics(8, 9),
      ScaryStatics(8, 3),
      ScaryStatics(9, 9),
      ScaryStatics(10, 12),
      ScaryStatics(11, 18),
      ScaryStatics(12, 8),
      ScaryStatics(13, 3),
      ScaryStatics(14, 4),
      ScaryStatics(15, 10),
      ScaryStatics(16, 12),
      ScaryStatics(17, 10),
      ScaryStatics(18, 8),
      ScaryStatics(19, 15),
      ScaryStatics(20, 12),
    ];
    final highestValue =
        data.reduce((curr, next) => curr.candy > next.candy ? curr : next);
    final smallestValue =
        data.reduce((curr, next) => curr.candy < next.candy ? curr : next);

    return [
      Series(
        id: 'Data',
        data: data,
        domainFn: (ScaryStatics data, _) => data.house.toString(),
        measureFn: (ScaryStatics data, _) => data.candy,
        colorFn: (data, _) {
          if (data.candy == highestValue.candy) {
            return Color.fromHex(code: '#18181A');
          }
          if (data.candy == smallestValue.candy) {
            return Color.fromHex(code: '#5E32BA');
          }
          return Color.fromHex(code: '#EB6123');
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final staticLabels = <TickSpec<int>>[
      // Possible to define style of labels directly inside
      TickSpec(5, style: TextStyleSpec(fontFamily: 'fofbb_reg')),
      TickSpec(10),
      TickSpec(15),
      TickSpec(20),
    ];

    final staticTicks = <TickSpec<String>>[
      // Possible to define style of labels directly inside
      TickSpec("1",
          label: "1 house", style: TextStyleSpec(fontFamily: 'fofbb_reg')),
      TickSpec("10", label: "10 house"),
      TickSpec("20", label: "20 house"),
    ];

    return BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: BarRendererConfig(
        cornerStrategy: const ConstCornerStrategy(7),
      ),
      primaryMeasureAxis: NumericAxisSpec(
        tickProviderSpec: StaticNumericTickProviderSpec(staticLabels),
        tickFormatterSpec:
            BasicNumericTickFormatterSpec((num value) => "$value 🍬"),
        renderSpec: GridlineRendererSpec(
          labelStyle: TextStyleSpec(
            fontSize: 11,
            color: Color.fromHex(code: '#96C457'),
          ),
          labelAnchor: TickLabelAnchor.after,
        ),
      ),
      domainAxis: OrdinalAxisSpec(
        tickProviderSpec: StaticOrdinalTickProviderSpec(staticTicks),
        renderSpec: SmallTickRendererSpec(
          labelStyle: TextStyleSpec(
            lineHeight: 3,
            fontSize: 11,
            color: Color.fromHex(code: '#5E32BA'),
          ),
          lineStyle: LineStyleSpec(
            color: Color.transparent,
          ),
        ),
      ),
    );
  }
}
