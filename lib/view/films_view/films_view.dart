import 'package:flutter/material.dart';
import 'package:revesion_app/view/films_view/components/films_grid.dart';

class FilmsView extends StatelessWidget {
  const FilmsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: FilmsGrid(
            isSearchView: false,
          ),
        ),
      ],
    );
  }
}
