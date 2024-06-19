import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/display/upcoming_time_display.dart';
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
              Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: ColorPalette.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  ),
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 36,
                                  foregroundImage: NetworkImage(
                                      'https://cdn.dribbble.com/users/1341408/screenshots/16441374/media/bfa8046d1062a3abe131eefe64653f59.jpg?resize=1600x1200&vertical=center'),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Tarkington',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Center(
                                child: CircleAvatar(
                                  radius: 36,
                                  foregroundImage: NetworkImage(
                                      'https://cdn.dribbble.com/userupload/4247758/file/original-b54882b8a6d01145e2792fa80104ba3e.jpg?resize=2048x1536'),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Hillenbrand',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              )
                            ],
                          )
                        ],
                      ),
                      UpcomingTimeDisplay(matchDateTime: DateTime.now().add(const Duration(days: 2)))
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
