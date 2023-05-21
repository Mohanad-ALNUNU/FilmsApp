import 'package:flutter/material.dart';
import 'package:films_app/controller/film_controller.dart';
import 'package:films_app/model/film_dto.dart';
import 'package:films_app/utils/constants.dart';
import 'package:films_app/utils/responsive.dart';
import 'package:films_app/view/films_view/components/film_image.dart';
import 'package:films_app/view/films_view/components/film_main_text.dart';
import 'package:films_app/view/films_view/components/film_metadata_text.dart';
import 'package:films_app/view/films_view/components/voting_bar.dart';

class FilmCard extends StatelessWidget {
  final FilmController _homeController = FilmController();
  final FilmDTO filmDTO;
  FilmCard({super.key, required this.filmDTO});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _homeController.showWatchDialog(filmDTO.id);
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: filmCardColor,
        elevation: 10,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(filmCartBorderRadius)),
        child: Column(
          children: [
            FilmImage(imageURL: filmDTO.image),
            Padding(
              padding: defaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilmMetadataText(
                    metadataText: filmDTO.duration,
                  ),
                  Responsive.getWidgetIfLarge(
                      context,
                      FilmMetadataText(
                        metadataText: filmDTO.category,
                      )),
                  FilmMetadataText(
                    metadataText: filmDTO.date,
                  )
                ],
              ),
            ),
            FilmMainText(text: filmDTO.title),
            VotingBar(value: filmDTO.rate),
          ],
        ),
      ),
    );
  }
}
