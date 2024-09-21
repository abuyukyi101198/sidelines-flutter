import 'package:flutter/material.dart';
import 'package:sidelines/utils/color_palette.dart';
import 'package:sidelines/widgets/misc/navigation_item.dart';

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
          SizedBox(
            height: 100,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                const CircleAvatar(
                  radius: 48,
                  backgroundColor: ColorPalette.secondaryColor,
                ),
                Positioned(
                    bottom: -5,
                    right: 130,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      decoration: const BoxDecoration(
                        color: ColorPalette.successColor,
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star_rate_rounded,
                            size: 16.0,
                            color: ColorPalette.textColor,
                          ),
                          SizedBox(
                            width: 2.0,
                          ),
                          Text(
                            '8.0',
                            style: TextStyle(
                                color: ColorPalette.textColor, height: 1.2),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const Text(
            'Name Surname',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: ColorPalette.primaryColor,
            ),
          ),
          const Text(
            '@username',
            style: TextStyle(color: ColorPalette.secondaryColor),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: ColorPalette.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  'Position',
                  style: TextStyle(color: ColorPalette.textColor, height: 1.0),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: ColorPalette.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  'Number X',
                  style: TextStyle(color: ColorPalette.textColor, height: 1.0),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: ColorPalette.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  'X matches played',
                  style: TextStyle(color: ColorPalette.textColor, height: 1.0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: ColorPalette.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  'X years old',
                  style: TextStyle(color: ColorPalette.textColor, height: 1.0),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
                decoration: const BoxDecoration(
                  color: ColorPalette.secondaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: const Text(
                  'Since Month X, XXXX',
                  style: TextStyle(color: ColorPalette.textColor, height: 1.0),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 36.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Goals',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'XX',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(width: 76.0,),
              Column(
                children: [
                  Text(
                    'Assists',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'XX',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(width: 76.0,),
              Column(
                children: [
                  Text(
                    'MVP',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 16.0),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'XX',
                    style: TextStyle(
                        color: ColorPalette.textColor, fontSize: 20.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
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
