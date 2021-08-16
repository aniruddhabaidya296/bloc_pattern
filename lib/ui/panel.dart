import 'package:bloc_patter_example_app/components/colors.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';

Widget returnPanel() {
  return Container(
    child: Column(
      children: [
        Container(
          height: SizeConfig.blockHeight * 32,
          color: Colors.transparent,
          // child: Text("This is the sliding Widget"),
        ),
        Expanded(
          // height: SizeConfig.blockHeight * 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(SizeConfig.blockWidth * 3),
                  topRight: Radius.circular(SizeConfig.blockWidth * 3)),
              color: Colors.white,
            ),
            width: SizeConfig.screenWidth * 1,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.blockHeight * 2,
                ),
                Icon(
                  Icons.expand_more,
                  color: COLORS.blackDark,
                ),
                Container(
                  width: SizeConfig.blockWidth * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.blockWidth * 20,
                        width: SizeConfig.blockWidth * 20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/QR.png"),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConfig.blockWidth * 2,
                      ),
                      Column(
                        children: [
                          Container(
                            width: SizeConfig.blockWidth * 50,
                            child: Text(
                              "Get an Auto instantly",
                              style: TextStyle(
                                  color: COLORS.blueDark,
                                  fontSize: SizeConfig.blockWidth * 5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: SizeConfig.blockWidth * 50,
                            child: Text(
                                "Scan the QR code on the Auto to book a ride on the spot"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.blockWidth * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.blockWidth * 15,
                        width: SizeConfig.blockWidth * 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Group 429.png"),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Prices As per Comride rate cars",
                          style: TextStyle(fontSize: SizeConfig.blockWidth * 4),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: SizeConfig.blockWidth * 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: SizeConfig.blockWidth * 15,
                        width: SizeConfig.blockWidth * 15,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Group 430.png"),
                          ),
                        ),
                      ),
                      Container(
                        width: SizeConfig.blockWidth * 50,
                        child: Text(
                          "No overcharge or negotiation",
                          style: TextStyle(fontSize: SizeConfig.blockWidth * 4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
