import 'package:flutter/material.dart';
import 'package:furniture_shop/furniture_ui/utils/CustomTextStyle.dart';
import 'package:furniture_shop/furniture_ui/widgets/main_drawer.dart';

class AboutUsPage extends StatefulWidget {
  static const routeName = '/about-us';
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          "About Us",
          style: CustomTextStyle.textFormFieldBold
              .copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Center(
            child: Text(
              "This is graduated project by Computer science department of science faculty  Banha University supervised by Dr/Mohamed Taha ",
              style: CustomTextStyle.textFormFieldMedium.copyWith(
                  fontSize: 24,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
