import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/views/profile_search_view.dart';
import 'package:sidelines/widgets/items/friend_list_item.dart';
import '../data/theme.dart';
import '../providers/friends_provider.dart';
import '../viewmodels/friends_view_model.dart';
import '../models/profile_model.dart';
import '../widgets/navigation/screen_navigation_bar.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({super.key});

  @override
  FriendsViewState createState() => FriendsViewState();
}

class FriendsViewState extends State<FriendsView> {
  late FriendsViewModel friendsViewModel;
  late Future<void> _friendsFuture;

  @override
  void initState() {
    super.initState();
    final friendsProvider =
        Provider.of<FriendsProvider>(context, listen: false);
    friendsViewModel = FriendsViewModel(friendsProvider);
    _friendsFuture = Future.value();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (friendsProvider.friends.isEmpty) {
        setState(() {
          _friendsFuture = friendsViewModel.fetchFriends();
        });
      }
    });
  }

  Future<void> _refreshFriends() async {
    await friendsViewModel.fetchFriends();
    setState(() {
      _friendsFuture = Future.value();
    });
  }

  @override
  Widget build(BuildContext context) {
    final friendsProvider = Provider.of<FriendsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text(
          'Friends',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
      ),
      body: FutureBuilder(
        future: _friendsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: GlobalTheme.colors.secondaryColor,
                color: GlobalTheme.colors.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: IconButton(
                onPressed: _refreshFriends,
                icon: Icon(
                  Icons.refresh_rounded,
                  color: GlobalTheme.colors.primaryColor,
                  size: 36.0,
                ),
              ),
            );
          }

          final friends = friendsProvider.friends;

          return Stack(
            children: [
              SafeArea(
                minimum: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RefreshIndicator(
                  color: GlobalTheme.colors.primaryColor,
                  backgroundColor: GlobalTheme.colors.backgroundColor,
                  onRefresh: _refreshFriends,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
                    itemCount: friends.isEmpty ? 1 : friends.length,
                    itemBuilder: (context, index) {
                      if (friends.isEmpty) {
                        return Center(
                          child: Text(
                            'No friends found.',
                            style: TextStyle(
                              color: GlobalTheme.colors.primaryColor,
                            ),
                          ),
                        );
                      }

                      ProfileModel friend = friends[index];
                      return FriendListItem(
                        profileModel: friend,
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0, // Adjust the distance from the bottom
                left: 20.0,
                right: 20.0,
                child: SizedBox(
                  width: double.infinity, // Ensure button spans full width
                  child: FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProfileSearchView()),
                      );
                    },
                    child: const Text('Add a Friend'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(currentIndex: 3),
    );
  }
}
