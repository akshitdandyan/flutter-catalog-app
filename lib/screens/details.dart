import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordpair_generator/models/catalog.dart';
import 'package:wordpair_generator/widgets/addToCart.dart';

class Details extends StatelessWidget {
  final Item catalog;

  const Details({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
      ),
      body: SafeArea(
          child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(2000),
                  bottomLeft: Radius.circular(2000))),
          child: Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
                height: 320,
              )),
        ),
        Expanded(
            child: Column(
          children: [
            Padding(padding: EdgeInsets.all(20)),
            Text(
              catalog.name,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
            ),
            Text(
              catalog.desc,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            Container(
              padding: EdgeInsets.all(14),
              alignment: Alignment.center,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.",
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ),
          ],
        )),
        Container(
          padding: EdgeInsets.all(20),
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${catalog.price}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              ),
              AddToCartButton(catalog: catalog),
            ],
          ),
        )
      ])),
    );
  }
}
