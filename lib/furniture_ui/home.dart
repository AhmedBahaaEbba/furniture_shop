import 'package:flutter/materialarchPage.dart';
import 'package:furniture_shop/furniture_ui/screens/favorites_page.dart';
import 'package:furniture_shop/furniture_ui/screens/profile_page.dart';
import 'package:furniture_shop/furniture_ui/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

import 'screens/cart_page.dart';
import 'screens/home_page.dart';
import 'utils/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map<String, Object>> _pages = [
    {
      'page': HomePage(),
      'title': 'HomePage',
    },
    {
      'page': FavoritesPage(),
      'title': 'Favorite',
    },
    {
      'page': CartPage(),
      'title': 'Cart',
    },
    {
      'page': ProfilePage(),
      'title': 'Your Favorites',
    },
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: _pages[_selectedPageIndex]['page'],
          ),
          Positioned(
            bottom: 0,
            child: CustomBottomNavigationBar(
              onIconPressedCallback: _selectPage,
            ),
          )
        ],
      ),
    );
  }
}
