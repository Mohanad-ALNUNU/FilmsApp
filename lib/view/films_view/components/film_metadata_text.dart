import 'package:flutter/material.dart';
import 'package:films_app/controller/film_controller.dart';
import 'package:films_app/utils/constants.dart';

class FilmMetadataText extends StatelessWidget {
  final String metadataText;
  const FilmMetadataText({super.key, required this.metadataText});

  @override
  Widget build(BuildContext context) {
    return Text(
      metadataText,
      style: TextStyle(
          fontWeight: filmMetadataTextWeight,
          fontSize: FilmController.getFilmMetadataTextSize(
              context, metadataText.length),
          color: filmTextColor),
    );
  }
}
