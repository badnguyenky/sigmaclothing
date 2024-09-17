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

class ColumnChart extends StatefulWidget {
  const ColumnChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
    required this.completedColumnColor,
    required this.incompleteColumnColor,
    required this.chartBackgroundColor,
    required this.chartBorderColor,
  });

  final double? width;
  final double? height;
  final List<ColumnChartDataStruct> chartData;
  final Color completedColumnColor;
  final Color incompleteColumnColor;
  final Color chartBackgroundColor;
  final Color chartBorderColor;

  @override
  State<ColumnChart> createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  double getMaxYValue() {
    // Find the maximum y value from both y1Value and y2Value in the chartData
    double maxY1Value = widget.chartData
        .map((data) => data.y1Value.toDouble())
        .reduce((a, b) => a > b ? a : b);
    double maxY2Value = widget.chartData
        .map((data) => data.y2Value.toDouble())
        .reduce((a, b) => a > b ? a : b);
    return maxY1Value > maxY2Value ? maxY1Value : maxY2Value;
  }

  @override
  Widget build(BuildContext context) {
    double maxYValue = getMaxYValue();
    return SfCartesianChart(
      plotAreaBackgroundColor: widget.chartBackgroundColor,
      plotAreaBorderWidth: 1,
      plotAreaBorderColor: widget.chartBorderColor,
      primaryXAxis: CategoryAxis(),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: maxYValue + 1,
        interval: 1,
      ),
      series: <CartesianSeries<ColumnChartDataStruct, String>>[
        ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          xValueMapper: (ColumnChartDataStruct data, _) => data.xValue,
          yValueMapper: (ColumnChartDataStruct data, _) => data.y1Value,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          // Customize the color and elevation (shadow)
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: widget.completedColumnColor,
        ),
        ColumnSeries<ColumnChartDataStruct, String>(
          dataSource: widget.chartData,
          xValueMapper: (ColumnChartDataStruct data, _) => data.xValue,
          yValueMapper: (ColumnChartDataStruct data, _) => data.y2Value,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          // Customize the color and elevation (shadow)
          borderRadius: BorderRadius.all(Radius.circular(3)),
          color: widget.incompleteColumnColor,
        ),
      ],
    );
  }
}
