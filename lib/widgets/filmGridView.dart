
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revesion_app/databaseManager/contentManager.dart';
import 'package:revesion_app/widgets/filmCard.dart';

class FilmGridView extends StatefulWidget {
  final Map<String, Map> filmsMapToDisplay;
  const FilmGridView({super.key, required this.filmsMapToDisplay});

  @override
  State<FilmGridView> createState() => _FilmGridViewState();
}

ContentManager contentManager = ContentManager();

class _FilmGridViewState extends State<FilmGridView> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return GridView.count(

        crossAxisCount: max(_screenWidth ~/ 280,2),
        crossAxisSpacing: _screenWidth / 50,
        mainAxisSpacing: _screenHeight / 35,
        children:  List.generate(widget.filmsMapToDisplay.length, (index) {
          return displayContent(_screenWidth, _screenHeight, widget.filmsMapToDisplay, context)[index];
        }));
  }
}

List<Widget> displayContent(_screenWidth, _screenHeight, filmsMapToDisplay, context) {
  FilmCard filmCard = FilmCard();
  List<Widget> readyToDisplayWidgets = [];
  filmsMapToDisplay.forEach((key, value) {
    readyToDisplayWidgets.add(
      filmCard.getFilmCard(_screenWidth,_screenHeight, value, context)
    );
  });
  return readyToDisplayWidgets;
}
