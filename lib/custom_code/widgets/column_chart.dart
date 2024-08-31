// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.completedColumnColor,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;
  final Color completedColumnColor;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 1.2,
        interval: 0.2,
      ),
      series: <CartesianSeries<ColumnChartDataStruct, String>>[
        ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          xValueMapper: (ColumnChartDataStruct data, _) => data.xValue,
          yValueMapper: (ColumnChartDataStruct data, _) => data.yValue,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          // Customize the color and elevation (shadow)
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: widget.completedColumnColor,
        ),
      ],
    );
  }
}
