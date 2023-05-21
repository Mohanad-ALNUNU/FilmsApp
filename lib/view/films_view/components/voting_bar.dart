import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:revesion_app/utils/constants.dart';

class VotingBar extends StatelessWidget {
  final double value;
  const VotingBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      RatingBar.builder(
        initialRating: value,
        minRating: votingBarMinValue,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: votingBarItemCount,
        itemSize: votingBarItemSize,
        itemBuilder: (context, _) => votingBarIcon,
        onRatingUpdate: (rating) {},
      )
    ]);
  }
}
