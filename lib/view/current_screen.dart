import 'package:flutter/material.dart';
import 'package:revesion_app/utils/constants.dart';
import 'package:revesion_app/view/films_view/films_view.dart';
import 'package:revesion_app/view/search_view/search_view.dart';
import 'package:sidebarx/sidebarx.dart';

class CurrentScreens extends StatelessWidget {
  const CurrentScreens({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = dummyCategoryMap[controller.selectedIndex]['name'];
        switch (controller.selectedIndex) {
          case 0:
            return const FilmsView();
          case 1:
            return const SearchView();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headlineSmall,
            );
        }
      },
    );
  }
}
