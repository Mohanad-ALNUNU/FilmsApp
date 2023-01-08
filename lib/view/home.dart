import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:revesion_app/widgets/filmGridView.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:revesion_app/databaseManager/contentManager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

  ContentManager contentManager = ContentManager();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const SizedBox(
        //   height: 20,
        // ),
        // ClipRRect(
        //     borderRadius: BorderRadius.circular(8),
        //     child: Image.network("https://picsum.photos/500/200/?blur")),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: FilmGridView(filmsMapToDisplay: contentManager.getContentMap(),),
        ),
      ],
    );
  }
}



List<Widget> displayCategories() {
  List<Widget> readyToDisplayWidgets = [];
  contentManager.getCategoriesMap().forEach((key, value) {
    readyToDisplayWidgets.add(Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextButton(
                  style: TextButton.styleFrom(),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      key,
                      style:
                          const TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ))))
    ]));
  });
  return readyToDisplayWidgets;
}
