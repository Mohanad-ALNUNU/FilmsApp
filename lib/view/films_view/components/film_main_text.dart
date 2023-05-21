import 'package:flutter/material.dart';
import 'package:films_app/controller/film_controller.dart';
import 'package:films_app/utils/constants.dart';

class FilmMainText extends StatelessWidget {
  final String text;
  const FilmMainText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontWeight: filmMainTextWeight,
          fontSize: FilmController.getFilmMainTextSize(context, text.length),
          color: filmTextColor,
        ),
        softWrap: true);
  }
}
