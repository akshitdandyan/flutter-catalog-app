import 'package:flutter/material.dart';
import 'package:wordpair_generator/models/cart.dart';
import 'package:wordpair_generator/screens/details.dart';
import 'package:wordpair_generator/screens/home.dart';
import 'package:wordpair_generator/models/catalog.dart';
import 'package:wordpair_generator/screens/routes.dart';
import 'package:wordpair_generator/widgets/addToCart.dart';
import 'package:wordpair_generator/widgets/catalogImage.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        Details(catalog: Catalog.items[index]))),
            child: CatalogItem(
              catalog: Catalog.items[index],
            ),
          );
        },
        itemCount: Catalog.items.length,
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(28)),
      padding: EdgeInsets.fromLTRB(12, 12, 0, 12),
      margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  catalog.name,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  catalog.desc,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${catalog.price}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      AddToCartButton(catalog: catalog),
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
