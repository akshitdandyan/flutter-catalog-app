import 'package:flutter/material.dart';
import 'package:wordpair_generator/widgets/themes.dart';

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: AppTheme.pinkLight,
        ),
        child: Image.network(
          image,
          width: 120,
        ));
  }
}
