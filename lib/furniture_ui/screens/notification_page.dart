import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/CustomTextStyle.dart';
import 'package:furniture_shop/furniture_ui/utils/CustomUtils.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_app_bar.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_drawer.dart';

class NotificationPage extends StatefulWidget {
  static const routeName = '/notification';

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar('Notification'),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return createNotificationListItem(index);
        },
        itemCount: getDummyList().length,
      ),
    );
  }

  createNotificationListItem(int index) {
    return Dismissible(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                width: 4,
                margin: EdgeInsets.only(right: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  color: Colors.green,
                ),
              ),
              flex: 02,
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        "Payment Complete",
                        style: CustomTextStyle.textFormFieldBlack
                            .copyWith(color: Colors.black, fontSize: 16),
                      ),
                      IconButton(icon: Icon(Icons.close), onPressed: () {})
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    child: Text(
                      "Thank you for your recent payment. Your monthly subscription has been activated until June 2020.",
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: CustomTextStyle.textFormFieldMedium
                          .copyWith(color: Colors.grey, fontSize: 12),
                    ),
                  )
                ],
              ),
              flex: 98,
            )
          ],
        ),
      ),
      key: Key("key_1"),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) {
        getDummyList().removeAt(index);
      },
      background: Container(
        color: Colors.green,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Utils.getSizedBox(width: 16)
          ],
        ),
      ),
    );
  }

  static List getDummyList() {
    List list = List.generate(10, (i) {
      return "Item ${i + 1}";
    });
    return list;
  }
}
