import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:films_app/controller/film_controller.dart';
import 'package:films_app/utils/constants.dart';
import 'package:films_app/utils/responsive.dart';
import 'package:films_app/view/films_view/components/film_card.dart';

class FilmsGrid extends StatelessWidget {
  final FilmController _homeController = Get.put(FilmController());
  final bool isSearchView;
  FilmsGrid({super.key, required this.isSearchView});

  @override
  Widget build(BuildContext context) {
    double screenWidth = Responsive.getScreenReolution(context)['width']!;
    double screenHeight = Responsive.getScreenReolution(context)['height']!;
    if (!isSearchView) {
      _homeController.getFilms();
    }
    return Obx(
      () => GridView.count(
          crossAxisCount: max(screenWidth ~/ filmsGridCrossAxisCountFactor,
              filmsGridMinCrossAxisCount),
          crossAxisSpacing: screenWidth / filmsGridCrossAxisSpacingFactor,
          mainAxisSpacing: screenHeight / filmsGridMainAxisSpacingFactor,
          children:
              List.generate(_homeController.filmsToDisplay.length, (index) {
            return FilmCard(
              filmDTO: _homeController.filmsToDisplay[index],
            );
          })),
    );
  }
}
