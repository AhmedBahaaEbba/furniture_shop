import 'package:flutter/material.dart';
import 'package:furniture_shop/providers/cart.dart';
import 'package:furniture_shop/providers/products.dart';
import 'package:provider/provider.dart';
import 'details_page.dart';

class Search extends StatelessWidget {
  static var routeName='Search';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){

          }),
        ],
      ),
    );
  }
}


class DataSearch extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query='';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context,null);
      },
    );
  }

  @override
  // ignore: missing_return
  Widget buildResults(BuildContext context) {


  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Products product=Provider.of<Products>(context);
    final cart = Provider.of<Cart>(context);
    final items=product.items;
    final suggestionList=query.isEmpty?items:items.where((e) => e.title.startsWith(query)).toList();
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: suggestionList[i],
        child: ListTile(
          title: RichText(text:TextSpan(text:suggestionList[i].title.substring(0,query.length),
          style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: suggestionList[i].title.substring(query.length),
              style: TextStyle(color: Colors.grey)),
            ]
          ),),
          onTap: (){
            Navigator.of(context)
                .pushNamed(DetailsScreen.routName, arguments: suggestionList[i].id);
          },
          leading: Image.network(suggestionList[i].imageUrl),
        ),
      ),
    );
  }
}
