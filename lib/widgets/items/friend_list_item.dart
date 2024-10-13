import 'package:flutter/material.dart';
import 'package:sidelines/widgets/badges/friend_badge.dart';
import '../../data/theme.dart';
import '../../models/profile_model.dart';
import '../../views/profile_view.dart';

class FriendListItem extends StatelessWidget {
  final ProfileModel profileModel;

  const FriendListItem({super.key, required this.profileModel});

  @override
  Widget build(BuildContext context) {
    List<Widget> badges = [
      FriendBadge(label: profileModel.formattedPosition),
    ];

    return Container();

    // if (profileModel.isTeammate != null && profileModel.isTeammate!) {
    //   badges.add(const SizedBox(width: 4.0));
    //   badges.add(FriendBadge(label: 'Teammate'));
    // }
    //
    // return GestureDetector(
    //   child: Container(
    //     width: MediaQuery.of(context).size.width,
    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
    //     child: Row(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           width: 48.0,
    //           height: 48.0,
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: GlobalTheme.colors.secondaryColor,
    //             image: profileModel.profilePictureUrl != null
    //                 ? DecorationImage(
    //                 image: NetworkImage(profileModel.profilePictureUrl!)
    //                 as ImageProvider,
    //                 fit: BoxFit.cover)
    //                 : null,
    //           ),
    //         ),
    //         const SizedBox(width: 12.0),
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 '${profileModel.firstName} ${profileModel.lastName}',
    //                 style: TextStyle(
    //                   color: GlobalTheme.colors.textColor,
    //                   fontSize: 15.0,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //                 maxLines: 1,
    //               ),
    //               const SizedBox(
    //                 height: 6.0,
    //               ),
    //               Text(
    //                 '@${profileModel.username}',
    //                 style: TextStyle(
    //                   color: GlobalTheme.colors.secondaryColor,
    //                   fontSize: 10.0,
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         const SizedBox(width: 16.0),
    //         Align(
    //           alignment: Alignment.centerRight,
    //           child: Row(
    //             children: badges,
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    //   onTap: () {
    //     Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (context) => ProfileView(profileId: profileModel.id),
    //       ),
    //     );
    //   },
    // );
  }
}
