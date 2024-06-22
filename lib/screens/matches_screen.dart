import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/display/team_badge.dart';
import 'package:sidelines/widgets/display/upcoming_match_card.dart';
import 'package:sidelines/widgets/display/upcoming_team_display.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Matches',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const UpcomingMatchCard(),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Recent Matches',
                style: TextStyle(color: ColorPalette.textColor, fontSize: 16),
              ),
              SizedBox(height: 8,),
              Container(
                  height: 156,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 16),
                        width: 132,
                        decoration: const BoxDecoration(
                          color: ColorPalette.primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('W', style: TextStyle(fontWeight: FontWeight.w700),),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TeamBadge(
                                  teamBadgeUrl: 'https://cdn.dribbble.com/userupload/4247758/file/original-b54882b8a6d01145e2792fa80104ba3e.jpg?resize=2048x1536',
                                  radius: 24,
                                ),
                                TeamBadge(
                                  teamName: 'Wiley',
                                    radius: 24
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Hillenbrand',),
                                    Text('1')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Wiley',),
                                    Text('0')
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          NavigationItem(iconPath: 'assets/icons/matches.svg'),
          NavigationItem(iconPath: 'assets/icons/teams.svg'),
          NavigationItem(iconPath: 'assets/icons/arrange.svg'),
          NavigationItem(iconPath: 'assets/icons/friends.svg'),
        ],
      ),
    );
  }
}
