import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidelines/widgets/fields/search_field.dart';
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
  late FriendsProvider friendsProvider;
  late Future<void> _friendsFuture;
  Future<void>? _searchFuture;

  String searchQuery = "";
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    friendsProvider =
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

  void _startSearch() {
    setState(() {
      isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      isSearching = false;
      searchQuery = "";
      _searchFuture = null;
      friendsProvider.setSearchResults([]);
    });
  }

  void _searchFriends(String query) {
    setState(() {
      searchQuery = query;
      _searchFuture = friendsViewModel.searchProfiles(searchQuery);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: !isSearching
            ? const Text(
                'Network',
                style: TextStyle(fontWeight: FontWeight.w700),
              )
            : SearchField(
                onChanged: _searchFriends,
              ),
        actions: !isSearching
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _startSearch,
                  ),
                ),
              ]
            : [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: TextButton(
                    onPressed: _stopSearch,
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(color: GlobalTheme.colors.secondaryColor),
                    ),
                  ),
                ),
              ],
      ),
      body: FutureBuilder(
        future: isSearching ? _searchFuture : _friendsFuture,
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

          final friends = isSearching
              ? friendsProvider.searchResults
              : friendsProvider.friends;

          return SafeArea(
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
          );
        },
      ),
      bottomNavigationBar: const ScreenNavigationBar(currentIndex: 3),
    );
  }
}
