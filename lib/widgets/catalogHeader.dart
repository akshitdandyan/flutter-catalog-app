import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "App Pulp",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w800, fontSize: 32),
        ),
        Padding(padding: EdgeInsets.all(14)),
        Text(
          "Trending",
          style: TextStyle(
              color: Colors.blue.shade600, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
