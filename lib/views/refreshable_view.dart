import 'package:flutter/material.dart';
import 'package:sidelines/data/theme.dart';

class RefreshableView extends StatelessWidget {
  final Future<void> future;
  final Future<void> Function() onRefresh;
  final Widget child;

  const RefreshableView({
    super.key,
    required this.future,
    required this.onRefresh,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
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
            onPressed: onRefresh,
            icon: Icon(
              Icons.refresh_rounded,
              color: GlobalTheme.colors.primaryColor,
              size: 36.0,
            ),
          ));
        }

        return SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20.0),
            child: RefreshIndicator(
              color: GlobalTheme.colors.primaryColor,
              backgroundColor: GlobalTheme.colors.backgroundColor,
              onRefresh: onRefresh,
              child: child,
            ));
      },
    );
  }
}
