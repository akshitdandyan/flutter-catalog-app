import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/core/store.dart';
import 'package:wordpair_generator/models/cart.dart';
import 'package:wordpair_generator/models/catalog.dart';

class AddToCartButton extends StatelessWidget {
  final Item catalog;
  AddToCartButton({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    final CartModel _cart = (VxState.store as Store).cart;
    bool isInCart = _cart.items.contains(catalog) || false;

    return ElevatedButton(
      onPressed: () {
        if (isInCart) return;
        AddMutation(catalog);
      },
      child: isInCart
          ? Icon(
              Icons.done,
              size: 18,
            )
          : Icon(
              CupertinoIcons.cart_badge_plus,
              size: 18,
            ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor: MaterialStateProperty.all(
              !isInCart ? Colors.blue : Colors.pink.shade300)),
    );
  }
}
