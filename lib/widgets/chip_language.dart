import 'package:flutter/material.dart';

class ChipLanguage extends StatelessWidget {
  final String language;

  const ChipLanguage(this.language);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.grey.withOpacity(0.9),
      label: Text(
        language,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
