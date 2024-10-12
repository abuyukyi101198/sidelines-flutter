import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            ));
          } else if (snapshot.hasError) {
            return Center(
                child: IconButton(
              onPressed: _refreshFriends,
              icon: Icon(
                Icons.refresh_rounded,
                color: GlobalTheme.colors.primaryColor,
                size: 36.0,
              ),
            ));
          }

          final friends = friendsProvider.friends;

          if (friends.isEmpty) {
            return const Center(child: Text('No friends found.'));
          }

          return SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              color: GlobalTheme.colors.primaryColor,
              backgroundColor: GlobalTheme.colors.backgroundColor,
              onRefresh: _refreshFriends,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 16.0, right: 8.0),
                child: ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    ProfileModel friend = friends[index];

                    return FriendListItem(
                      profileModel: friend,
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(currentIndex: 3),
    );
  }
}
