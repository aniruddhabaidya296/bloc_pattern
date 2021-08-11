import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/size_config.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

MaterialButton _button(
    String text, String routeName, BuildContext context, Color color) {
  return MaterialButton(
      minWidth: SizeConfig.blockWidth * 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      color: color,
      child: Text("$text"),
      onPressed: () => {Navigator.pushNamed(context, '$routeName')});
}

var locationStatus;
var bluetoothStatus;

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.yellow[100],
        appBar: AppBar(
          title: Text("WELCOME"),
          centerTitle: true,
        ),
        body: Container(
            child: Center(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.blockWidth * 5,
                  vertical: SizeConfig.blockHeight * 5),
              // height: SizeConfig.blockHeight * 80,
              width: SizeConfig.blockWidth * 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[100],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button("Single Student UI", '/single_student', context,
                        Colors.purple),
                    SizedBox(height: SizeConfig.blockHeight * 2),
                    _button("University List UI", '/university_list', context,
                        Colors.blue),
                    SizedBox(height: SizeConfig.blockHeight * 2),
                    // _button(
                    //     "Delinking UI", '/delinking', context, Colors.green),
                    // SizedBox(height: SizeConfig.blockHeight * 2),
                    // _button("Linking UI", '/linking', context, Colors.yellow),
                    // SizedBox(height: SizeConfig.blockHeight * 2),
                    // _button("Add Cow UI", '/add_cow', context, Colors.orange),
                    // SizedBox(height: SizeConfig.blockHeight * 2),
                    // Text("Cow Locator")
                  ],
                ),
              )),
        )));
  }
}
