import 'package:bloc_patter_example_app/components/colors.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';

class InstantBooking extends StatefulWidget {
  const InstantBooking({Key key}) : super(key: key);

  @override
  _InstantBookingState createState() => _InstantBookingState();
}

class _InstantBookingState extends State<InstantBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: SizeConfig.blockWidth * 6),
                  Container(
                    width: SizeConfig.blockHeight * 10,
                    height: SizeConfig.blockHeight * 10,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(SizeConfig.blockWidth * 2),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black26,
                          blurRadius: 5.0,
                        ),
                      ],
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/licance.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: SizeConfig.blockWidth * 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Rahul D Souza',
                        style: TextStyle(
                          color: COLORS.blueDark,
                          //fontFamily: 'Rubik',
                          fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockWidth * 4.5,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 0.5,
                      ),
                      Text(
                        'Honda Civic',
                        style: TextStyle(
                          color: COLORS.blueDark,
                          //fontFamily: 'Rubik',
                          // fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockWidth * 3.5,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockHeight * 0.5,
                      ),
                      Text(
                        'AH201358697',
                        style: TextStyle(
                          color: COLORS.blueDark,
                          //fontFamily: 'Rubik',
                          // fontWeight: FontWeight.w700,
                          fontSize: SizeConfig.blockWidth * 3.5,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              Positioned(
                right: SizeConfig.blockWidth * 10,
                child: Container(
                  width: SizeConfig.blockHeight * 7,
                  height: SizeConfig.blockHeight * 4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage('assets/images/sedan.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 8,
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            alignment: Alignment.centerLeft,
            child: Text(
              "Payment method",
              style: TextStyle(
                  color: COLORS.blueDark, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 2,
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            height: SizeConfig.blockHeight * 7.7,
            margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3.5),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                // color: const Color(0xFF66BB6A),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: SizeConfig.blockWidth * 3),
                  leading: Container(
                    height: SizeConfig.blockHeight * 5.5,
                    width: SizeConfig.blockWidth * 5.5,
                    margin: EdgeInsets.only(left: SizeConfig.blockWidth * 1.5),
                    child: Image.asset(
                      "assets/images/rupee.png",
                      height: SizeConfig.blockWidth * 3.5,
                      width: SizeConfig.blockWidth * 3.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                  title: Text(
                    "Cash",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Rubik',
                      color: COLORS.greenMedium,
                      fontSize: SizeConfig.blockWidth * 4.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: COLORS.blueMedium,
                    size: SizeConfig.blockWidth * 7,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            alignment: Alignment.centerLeft,
            child: Text(
              "From",
              style: TextStyle(
                  color: COLORS.blueDark, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 2,
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            height: SizeConfig.blockHeight * 7.7,
            margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3.5),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                // color: const Color(0xFF66BB6A),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: SizeConfig.blockWidth * 4),
                  title: Text(
                    "Ranganath Compound, Hosur Rd, Santhaadsfghkjlsdfghjkl;",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      letterSpacing: SizeConfig.blockWidth * 0.2,
                      fontFamily: "Rubik",
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            alignment: Alignment.centerLeft,
            child: Text(
              "To",
              style: TextStyle(
                  color: COLORS.blueDark, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 2,
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            height: SizeConfig.blockHeight * 7.7,
            margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 3.5),
            decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                // color: const Color(0xFF66BB6A),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5.0,
                  ),
                ]),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: SizeConfig.blockWidth * 3),
                  title: Text(
                    "328-332,13th Main Rd,Teachers Colony, Compound, Hosur Rd, Santha..",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        letterSpacing: SizeConfig.blockWidth * 0.2,
                        fontFamily: "Rubik"),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: SizeConfig.blockWidth * 92,
            child: Material(
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: SizeConfig.blockWidth * 4),
                  leading: Text(
                    "Estimated Price:",
                    style: TextStyle(
                        fontFamily: "Rubik", fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    "130.00",
                    style: TextStyle(
                        fontFamily: "Rubik", fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: SizeConfig.blockHeight * 8,
          ),
          Container(
            width: SizeConfig.blockWidth * 86,
            alignment: Alignment.center,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.blockWidth * 1.7)),
              ),
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
                                  child: Column(
                                    // runSpacing: SizeConfig.blockHeight * 2,
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          Icons.payment,
                                          color: COLORS.blueDark,
                                          size: SizeConfig.blockWidth * 7,
                                        ),
                                        horizontalTitleGap: 0,
                                        title: Text(
                                          "Online Payment",
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: COLORS.blueDark,
                                            // fontSize: SizeConfig.blockWidth * 5,
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
                                          width: SizeConfig.blockWidth * 6,
                                          height: SizeConfig.blockHeight * 6,
                                        ),
                                        horizontalTitleGap: 0,
                                        title: Text(
                                          "Cash",
                                          style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: COLORS.greenMedium,
                                            // fontSize: SizeConfig.blockWidth * 5,
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
              padding: EdgeInsets.fromLTRB(
                  SizeConfig.blockWidth * 35,
                  SizeConfig.blockHeight * 2,
                  SizeConfig.blockWidth * 35,
                  SizeConfig.blockHeight * 2),
              color: COLORS.blueDark,
              child: Text(
                "Confirm",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: COLORS.whiteDark,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.w400,
                  fontSize: SizeConfig.blockWidth * 4.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
