import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/display/profile/name_display.dart';
import 'package:sidelines/widgets/display/profile/profile_display.dart';
import 'package:sidelines/widgets/display/profile/statistics_display.dart';
import 'package:sidelines/widgets/display/profile/tag_display.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ios_share),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ProfileDisplay(overallRating: 7),
          const SizedBox(
            height: 24.0,
          ),
          const NameDisplay(
            firstName: 'firstName',
            lastName: 'lastName',
            username: 'username',
          ),
          const TagDisplay(
            positionData: 'CM',
            numberData: '6',
            playedData: '12',
            ageData: '23',
            joinData: 'September 23rd, 2024',
          ),
          const StatisticsDisplay(goalsData: 23, assistsData: 36, mvpData: 7),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 1.7,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: false,
                  ),
                  titlesData: FlTitlesData(
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
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(
                                fontSize: 10.0,
                                color: ColorPalette.secondaryColor);

                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 16.0,
                              child: Text(
                                value.toString(),
                                style: style,
                              ),
                            );
                          }),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  minX: 0,
                  maxX: 5,
                  minY: 0,
                  maxY: 10,
                  lineTouchData: LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 7.2),
                        FlSpot(1, 7.8),
                        FlSpot(2, 8.3),
                        FlSpot(3, 7.6),
                        FlSpot(4, 9.2),
                        FlSpot(5, 8.7),
                      ],
                      isCurved: true,
                      color: ColorPalette.primaryColor,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          NavigationItem(iconPath: 'assets/icons/matches.svg'),
          NavigationItem(iconPath: 'assets/icons/teams.svg'),
          NavigationItem(iconPath: 'assets/icons/arrange.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
        ],
      ),
    );
  }
}
