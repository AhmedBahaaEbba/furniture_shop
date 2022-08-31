import 'package:flutter/material.dart';
import 'package:furniture_shop/models/category.dart';
import 'package:furniture_shop/providers/categories.dart';
import 'package:provider/provider.dart';

class ManageCategoriesScreen extends StatefulWidget {
  static const routeName = 'manage-categories-screen';

  @override
  _ManageCategoriesScreenState createState() => _ManageCategoriesScreenState();
}

class _ManageCategoriesScreenState extends State<ManageCategoriesScreen> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;
  Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Category'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
//        child: ListView.builder(itemBuilder: (ctx, index) => Container()),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please Enter a title !';
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) {},
                onSaved: (value) {
                  category = Category(title: value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<Categories>(context, listen: false)
          .addCategory(category);
    } catch (error) {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text('An error Occurred!'),
            content: Text('SomeThing Went Wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          );
        },
      );
    }

    setState(
      () {
        _isLoading = false;
      },
    );
    Navigator.of(context).pop();
  }
}
