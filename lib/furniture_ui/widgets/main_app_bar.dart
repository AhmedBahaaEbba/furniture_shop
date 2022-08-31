import 'package:flutter/material.dart';

import 'file:///C:/Projects/my_shop/lib/furniture_ui/screens/DataSearchon_page.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;

  MainAppBar(this.title);
  @override
  Widget build(BuildContext context) {
    return AppBar(
//        leading: IconButton(
//            icon: Icon(Icons.sort),
//            onPressed: () {
//              Scaffold.of(context).openDrawer();
//            }),
      elevation: 0,
      title: Text(title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DataSearch());
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
