import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../utils/color_palette.dart';

class PerformanceChart extends StatelessWidget {
  final List<double> ratings;

  const PerformanceChart({super.key, required this.ratings});

  SideTitleWidget getTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10.0, color: ColorPalette.secondaryColor);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16.0,
      child: Text(
        value.toString(),
        style: style,
      ),
    );
  }

  FlTitlesData getFlTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: true),
      ),
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
            getTitlesWidget: getTitlesWidget),
      ),
    );
  }

  List<FlSpot> getFlSpots(List<double> ratings) {
    List<FlSpot> flSpotsList = [];
    for (final (index, rating) in ratings.indexed) {
      flSpotsList.add(FlSpot(index.toDouble(), rating));
    }
    return flSpotsList;
  }

  LineChartData getLineChartData() {
    return LineChartData(
      minX: 0,
      maxX: 5,
      minY: 0,
      maxY: 10,
      lineTouchData: const LineTouchData(enabled: false),
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: getFlTitlesData(),
      lineBarsData: [
        LineChartBarData(
          isCurved: true,
          color: ColorPalette.primaryColor,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          spots: getFlSpots(ratings),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Performance',
          style: TextStyle(color: ColorPalette.primaryColor),
        ),
        const SizedBox(height: 2.0,),
        Container(
          height: 2,
          width: 120,
          decoration: const BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(1.0)),
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 2,
            child: LineChart(
              getLineChartData(),
            ),
          ),
        ),
      ],
    );
  }
}
