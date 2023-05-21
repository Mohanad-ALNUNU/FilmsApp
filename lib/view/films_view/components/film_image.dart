import 'dart:math';

import 'package:flutter/material.dart';
import 'package:films_app/utils/constants.dart';
import 'package:films_app/utils/responsive.dart';

class FilmImage extends StatelessWidget {
  final String imageURL;
  const FilmImage({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: filmsImagePadding,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(filmCartBorderRadius),
          child: Image.network(
            imageURL,
            height: max(Responsive.getScreenReolution(context)['width']! / 14,
                minFilmCardImageHight),
          )),
    );
  }
}
