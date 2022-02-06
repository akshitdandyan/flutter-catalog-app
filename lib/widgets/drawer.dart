import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  final imageUrl =
      "https://miro.medium.com/max/3150/1*fxNbrQsCjUv13tmfJkzn1w.jpeg";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
                accountName: const Text("James Meyer"),
                accountEmail: const Text("james@eraaxit.tech"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.pink,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.pink),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.pink,
            ),
            title: Text(
              "Profile",
              style: TextStyle(color: Colors.pink),
            ),
          ),
          const ListTile(
            leading: Icon(
              CupertinoIcons.bag,
              color: Colors.pink,
            ),
            title: Text(
              "Products",
              style: TextStyle(color: Colors.pink),
            ),
          )
        ],
      ),
    );
  }
}
