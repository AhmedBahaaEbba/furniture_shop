import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/All.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/BedRoom.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/Cupbord.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/armchair.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/outdoor.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/sofa.dart';
import 'package:furniture_shop/furniture_ui/screens/tabs_screens/table.dart';

import './DataSearch.dart';
import '../utils/constants.dart';
import '../widgets/main_drawer/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Home'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //Navigator.of(context).pushNamed(Search.routeName);
                showSearch(context: context, delegate: DataSearch());
              },
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Armchair',
              ),
              Tab(
                text: 'Bed',
              ),
              Tab(
                text: 'Sofa',
              ),
              Tab(
                text: 'Outdoor',
              ),
              Tab(
                text: 'Table',
              ),
              Tab(
                text: 'Kitchen',
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        backgroundColor: kPrimaryColor,
        body: TabBarView(children: <Widget>[
          All(),
          ArmChair(),
          Bedroom(),
          Sofa(),
          Outdoor(),
          Tables(),
          Kitchen(),
        ]),
      ),
    );
  }
}
