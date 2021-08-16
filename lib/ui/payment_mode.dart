import 'package:bloc_patter_example_app/components/colors.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';

class PaymentMode extends StatefulWidget {
  const PaymentMode({Key key}) : super(key: key);

  @override
  _PaymentModeState createState() => _PaymentModeState();
}

class _PaymentModeState extends State<PaymentMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.west,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/navigator_page');
          },
        ),
      ),
      body: Container(
        child: Center(
          child: MaterialButton(
            child: Text("Click Me"),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (ctx) => Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: SizeConfig.blockHeight * -3.5,
                      child: Container(
                        // height: SizeConfig.blockHeight * 20,
                        child: AlertDialog(
                          content: Builder(
                            builder: (context) {
                              return Container(
                                width: SizeConfig.blockWidth * 100,
                                // height: SizeConfig.blockHeight * 20,
                                child: Wrap(
                                  // runSpacing: SizeConfig.blockHeight * 2,
                                  children: [
                                    ListTile(
                                      leading: Icon(
                                        Icons.payment,
                                        color: COLORS.blueDark,
                                        size: SizeConfig.blockWidth * 8,
                                      ),
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        "Online Payment",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          color: COLORS.blueDark,
                                          fontSize: SizeConfig.blockWidth * 5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      height: SizeConfig.blockHeight * 2,
                                      thickness: SizeConfig.blockWidth * 0.5,
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.only(
                                          left: SizeConfig.blockWidth * 5),
                                      leading: Image.asset(
                                        "assets/images/rupee.png",
                                        width: SizeConfig.blockWidth * 7,
                                        height: SizeConfig.blockHeight * 7,
                                      ),
                                      horizontalTitleGap: 0,
                                      title: Text(
                                        "Cash",
                                        style: TextStyle(
                                          fontFamily: 'Rubik',
                                          color: COLORS.greenMedium,
                                          fontSize: SizeConfig.blockWidth * 5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
