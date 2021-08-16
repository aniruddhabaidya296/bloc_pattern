import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:flutter/material.dart';

tripScheduledSuccessfully(BuildContext context, String title) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          width: SizeConfig.blockWidth * 100,
          top: SizeConfig.blockHeight * 48,
          child: Container(
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
              ),
              content: Builder(
                builder: (context) {
                  return Container(
                    height: SizeConfig.blockHeight * 34,
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.blockHeight * 1),
                        Container(
                          width: SizeConfig.blockWidth * 85,
                          alignment: Alignment.center,
                          child: Icon(Icons.check_circle_outline,
                              size: SizeConfig.blockWidth * 10,
                              color: Color(0xff0F203C)),
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 3.5),
                        SizedBox(height: SizeConfig.blockHeight * 1),
                        Container(
                          width: SizeConfig.blockWidth * 85,
                          alignment: Alignment.center,
                          child: Text(
                            "Trip Scheduled Successfully",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff0F203C),
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold,
                                fontSize: SizeConfig.blockWidth * 5.5),
                          ),
                        ),
                        SizedBox(height: SizeConfig.blockHeight * 4.5),
                        Container(
                          width: SizeConfig.blockWidth * 20,
                          alignment: Alignment.center,
                          child: matButton(
                            title: "Ok",
                            buttonColor: Color(0xff0F203C),
                            icon: Icons.check_circle_outline,
                            textColor: Colors.white,
                            onPress: () => {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  '/scheduled_rides', (route) => false),
                            },
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
}

Widget matButton(
    {String title,
    IconData icon,
    Color buttonColor,
    Color textColor,
    Color borderColor,
    double minwidth,
    VoidCallback onPress}) {
  return Container(
    height: SizeConfig.blockHeight * 7,
    child: MaterialButton(
      minWidth: (minwidth != null) ? minwidth : SizeConfig.blockWidth * 30,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            width: SizeConfig.blockWidth * 0.5,
            color: (borderColor != null) ? borderColor : buttonColor),
        borderRadius: BorderRadius.circular(SizeConfig.blockWidth * 2),
      ),
      color: buttonColor,
      onPressed: () {
        onPress();
        // Navigator.of(ctx).pop();
      },
      child: Row(
        children: [
          Icon(
            icon,
            color: textColor,
            size: SizeConfig.blockWidth * 4,
          ),
          SizedBox(width: SizeConfig.blockWidth * 1),
          Text(
            "$title",
            style: TextStyle(
                fontSize: SizeConfig.blockWidth * 4,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                color: textColor),
          ),
        ],
      ),
    ),
  );
}
