import 'package:flutter/material.dart';

class ChipGenres extends StatelessWidget {
  final String genres;

  const ChipGenres(this.genres);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.grey.withOpacity(0.9),
      label: Text(
        genres,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
