import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wordpair_generator/core/store.dart';
import 'package:wordpair_generator/models/cart.dart';
import 'package:wordpair_generator/models/catalog.dart';
import 'package:wordpair_generator/screens/routes.dart';
import 'package:wordpair_generator/widgets/catalogHeader.dart';
import 'package:wordpair_generator/widgets/catalogList.dart';
import 'package:wordpair_generator/widgets/themes.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');

    // final response = await http.Client().get(Uri.parse(url));
    // print("__________________________________");
    // print(response.body);
    // final catalogJson = response.body;

    final decodedCatalogJson = jsonDecode(catalogJson);
    final productsData = decodedCatalogJson["products"];

    Catalog.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as Store).cart;
    return Scaffold(
      backgroundColor: AppTheme.pinkLight,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, __, _) {
          return FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.cartRoute),
            child: Icon(CupertinoIcons.cart),
          ).badge(count: cart.items.length, color: Colors.pink, size: 22);
        },
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                Catalog.items.length > 1
                    ? Expanded(child: CatalogList())
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            )),
      ),
    );
  }
}


      // appBar: AppBar(
      //   title: Text(
      //     "App Pulp",
      //     style: TextStyle(color: Colors.blue),
      //   ),
      // ),
      // drawer: AppDrawer(),
      // body: (Catalog.items.length > 0)
      //     ? GridView.builder(
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2, mainAxisSpacing: 18, crossAxisSpacing: 16),
      //         itemBuilder: (context, index) {
      //           final item = Catalog.items[index];
      //           return Card(
      //               clipBehavior: Clip.antiAlias,
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(12)),
      //               child: GridTile(
      //                 child: Image.network(item.image),
      //                 header: Container(
      //                   child: Text(
      //                     item.name,
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   padding: EdgeInsets.all(6),
      //                   decoration: BoxDecoration(
      //                     color: Colors.blue,
      //                   ),
      //                 ),
      //                 footer: Container(
      //                   child: Text(
      //                     "\$${item.price}",
      //                     style: TextStyle(color: Colors.white),
      //                   ),
      //                   padding: EdgeInsets.all(6),
      //                   decoration: BoxDecoration(
      //                     color: Colors.black,
      //                   ),
      //                 ),
      //               ));
      //         },
      //         itemCount: Catalog.items.length,
      //       )
      //     : Center(
      //         child: CircularProgressIndicator(),
      //       ),