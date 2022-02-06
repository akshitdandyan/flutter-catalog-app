import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/core/store.dart';
import 'package:wordpair_generator/models/cart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffdbea),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.blue),
        ),
      ),
      body: Column(
        children: [Expanded(child: CartList()), Divider(), CartTotal()],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as Store).cart;
    return _cart.items.length == 0
        ? Center(
            child: Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "No items added",
                style: TextStyle(color: Colors.pink, fontSize: 22),
              ),
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.pink,
                ),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: Text(_cart.items[index].name),
            ),
          );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as Store).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          VxBuilder(
              mutations: {RemoveMutation},
              builder: (context, __, _) {
                return Text(
                  "\$${_cart.totalPrice}",
                  style: TextStyle(fontSize: 22, color: Colors.pink.shade400),
                );
              }),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Just a demo app")));
            },
            child: Text(
              "Buy",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                overlayColor: MaterialStateProperty.all(Colors.white)),
          )
        ],
      ),
    );
  }
}
