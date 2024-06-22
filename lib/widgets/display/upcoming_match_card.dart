import 'package:flutter/cupertino.dart';
import 'package:sidelines/widgets/display/upcoming_team_display.dart';
import 'package:sidelines/widgets/display/upcoming_time_display.dart';

import '../../utils/color_palette.dart';

class UpcomingMatchCard extends StatelessWidget {
  const UpcomingMatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: ColorPalette.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UpcomingTeamDisplay(
                  teamName: 'Club Internacional de Futbol',
                  teamBadgeUrl:
                      'https://cdn.dribbble.com/users/1341408/screenshots/16441374/media/bfa8046d1062a3abe131eefe64653f59.jpg?resize=1600x1200&vertical=center',
                ),
                UpcomingTeamDisplay(
                  teamName: 'Derby City',
                  teamBadgeUrl:
                      'https://cdn.dribbble.com/userupload/4247758/file/original-b54882b8a6d01145e2792fa80104ba3e.jpg?resize=2048x1536',
                ),
              ],
            ),
            UpcomingTimeDisplay(
                matchDateTime: DateTime.now().add(const Duration(days: 2)))
          ],
        ));
  }
}
