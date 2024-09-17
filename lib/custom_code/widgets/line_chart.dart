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
    required this.incompletedLineColor,
  });

  final double? width;
  final double? height;
  final List<ChartDataStruct> chartData;
  final Color completedLineColor;
  final Color incompletedLineColor;

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
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
      tooltipBehavior: TooltipBehavior(
        enable: true,
        format: 'point.x : point.y',
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          final ChartDataStruct chartData = data;
          // Determine the color based on the series (completed or incomplete)
          Color tooltipColor;
          String tooltipLabel;

          if (seriesIndex == 0) {
            // Assuming seriesIndex 0 is for completed
            tooltipColor = widget.completedLineColor;
            tooltipLabel = '${chartData.xValue}: ${chartData.y1Value}';
          } else {
            // Assuming seriesIndex 1 is for incomplete
            tooltipColor = widget.incompletedLineColor;
            tooltipLabel = '${chartData.xValue}: ${chartData.y2Value}';
          }
          // Assuming xValue is already formatted as 'dd MMM yy'
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: tooltipColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: Text(
              tooltipLabel,
              style: TextStyle(
                color: tooltipColor,
                fontSize: 14,
              ),
            ),
          );
        },
      ),
      crosshairBehavior: CrosshairBehavior(
        enable: true,
        lineType: CrosshairLineType
            .vertical, // Show both vertical and horizontal lines
        lineWidth: 1,
        lineDashArray: [5, 5], // Dashed line pattern
        activationMode: ActivationMode.singleTap, // Crosshair activates on tap
        shouldAlwaysShow: false, // Show crosshair only when interacting
      ),
      primaryXAxis: CategoryAxis(
          labelPlacement: LabelPlacement.onTicks,
          interactiveTooltip: InteractiveTooltip(enable: true)),
      primaryYAxis: NumericAxis(
        minimum: 0,
        maximum: maxYValue + 1,
        interval: 10,
        interactiveTooltip: InteractiveTooltip(enable: true),
      ),
      series: <CartesianSeries>[
        SplineSeries<ChartDataStruct, String>(
          color: widget.completedLineColor,
          dataSource: widget.chartData,
          xValueMapper: (ChartDataStruct data, _) => data.xValue,
          yValueMapper: (ChartDataStruct data, _) => data.y1Value,
          markerSettings: MarkerSettings(
            color: widget.completedLineColor,
            isVisible: true,
            width: 10,
            height: 10,
          ),
        ),
        SplineSeries<ChartDataStruct, String>(
          color: widget.incompletedLineColor,
          dataSource: widget.chartData,
          xValueMapper: (ChartDataStruct data, _) => data.xValue,
          yValueMapper: (ChartDataStruct data, _) => data.y2Value,
          markerSettings: MarkerSettings(
            color: widget.incompletedLineColor,
            isVisible: true,
            width: 10,
            height: 10,
          ),
        ),
      ],
    );
  }
}
