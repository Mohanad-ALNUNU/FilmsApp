import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revesion_app/controller/scaleSize.dart';

class FilmCard {
  ScaleSize scaleSize = ScaleSize();
  Widget getFilmCard(screenWidth, screenHeight, filmInfoMap, context) {
    Size screenSize = WidgetsBinding.instance.window.physicalSize;
    double width = screenSize.width;
    double height = screenSize.height;
    double dateDureFontSize = (screenWidth / 1280) * 12;
    print(5.27273*(screenWidth/1920)+5.8);
    print(width);
    print(screenWidth);
    return SizedBox(
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: const Color(0xFF2E2E48),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  filmInfoMap['image'],
                  height: max(screenWidth / 14, 50),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filmInfoMap['duree'],
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 5.27273*(screenWidth/1920)+5.8,
                        color: Colors.white60),
                  ),
                  Text(
                    filmInfoMap['date'],
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 5.27273*(screenWidth/1920)+5.8,
                        color: Colors.white60),
                  )
                ],
              ),
            ),
            // Container(
            //   // padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            //   child :Text(
            //      "This is example of textoverflow ellipsis, In the end there are the dots",
            //    style: TextStyle(fontSize: 22),
            //    overflow: TextOverflow.clip,
            //    textAlign: TextAlign.center,
            //    softWrap: false,
            //   )),
            Text(filmInfoMap['title'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 5.27273*((screenWidth-(filmInfoMap['title'].length))/1920)+7,
                    color: Colors.white70),
                softWrap: true),
          ],
        ),
      ),
    );
  }
}
