// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class LineChart extends StatefulWidget {
  const LineChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.completedLineColor,
    required this.markerColor,
  });

  final double? width;
  final double? height;
  final List<ChartDataStruct> chartData;
  final Color completedLineColor;
  final Color markerColor;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: DateTimeAxis(
        dateFormat: DateFormat.yMMM(),
        intervalType: DateTimeIntervalType.months,
      ),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: 50,
        interval: 10,
      ),
      series: <CartesianSeries>[
        SplineSeries<ChartDataStruct, DateTime>(
          color: widget.completedLineColor,
          dataSource: widget.chartData,
          xValueMapper: (ChartDataStruct data, _) => data.xValue,
          yValueMapper: (ChartDataStruct data, _) => data.yValue,
          markerSettings: MarkerSettings(
            color: widget.markerColor,
            isVisible: true,
            width: 10,
            height: 10,
          ),
        ),
      ],
    );
  }
}
