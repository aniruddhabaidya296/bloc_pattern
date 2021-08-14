import 'package:bloc_patter_example_app/components/colors.dart';
import 'package:bloc_patter_example_app/components/custom_picker.dart';
import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/components/utils.dart';
import 'package:bloc_patter_example_app/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dialogs.dart';

class ScheduleRides extends StatefulWidget {
  const ScheduleRides({Key? key}) : super(key: key);

  @override
  _ScheduleRidesState createState() => _ScheduleRidesState();
}

class _ScheduleRidesState extends State<ScheduleRides> {
  List<String> days = [];
  void buildDays() {
    for (int i = 1; i <= 31; i++) {
      if (i < 10) {
        days.add(i.toString().padLeft(2, '0'));
      } else {
        days.add(i.toString());
      }
    }
  }

  List<String> hours = [];
  void buildHours() {
    for (int i = 1; i <= 12; i++) {
      if (i < 10) {
        hours.add(i.toString().padLeft(2, '0'));
      } else {
        hours.add(i.toString());
      }
    }
  }

  List<String> mins = [];
  void buildMins() {
    for (int i = 1; i <= 60; i++) {
      if (i < 10) {
        mins.add(i.toString().padLeft(2, '0'));
      } else {
        mins.add(i.toString());
      }
    }
  }

  List<String> aps = ["AM", "PM"];

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  var day;
  var month;
  var min;
  var hour;
  var ap;
  var dayIndex;
  var monthIndex;
  var minIndex;
  var hourIndex;
  var apIndex;

  @override
  void initState() {
    super.initState();
    buildDays();
    buildHours();
    buildMins();
    dayIndex = 0;
    monthIndex = 0;
    minIndex = 0;
    hourIndex = 0;
    apIndex = 0;
  }

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
              setState(() {
                day = days[dayIndex];
                month = months[monthIndex];
              });
              schedulePickUp(context, day, dayIndex, month, monthIndex);
            },
          ),
        ),
      ),
    );
  }

  schedulePickUp(BuildContext context, String day, int dayIndex, String month,
      int monthIndex) async {
    min = mins[minIndex];
    hour = hours[hourIndex];
    ap = aps[apIndex];
    day = days[dayIndex];
    month = months[monthIndex];
    // int index = 0;
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            width: SizeConfig.blockWidth * 100,
            top: SizeConfig.blockHeight * 45,
            child: Container(
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(SizeConfig.blockWidth * 2),
                ),
                title: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Schedule Pick Up",
                    style: TextStyle(
                        color: Color(0xff0F203C),
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.blockWidth * 5.5),
                  ),
                ),
                content: Builder(
                  builder: (context) {
                    return StatefulBuilder(builder: (ctx, stateState) {
                      return Container(
                        height: SizeConfig.blockHeight * 30,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Select Date",
                                style: TextStyle(
                                    color: Color(0xff0F203C),
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w400,
                                    fontSize: SizeConfig.blockWidth * 4),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 1),
                            Container(
                              width: SizeConfig.blockWidth * 85,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Utils.showSheet(
                                    context,
                                    child: Container(
                                      width: SizeConfig.blockWidth * 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 300,
                                            width: SizeConfig.blockWidth * 30,
                                            child: CupertinoPicker(
                                              itemExtent: 64,
                                              diameterRatio: 0.7,
                                              looping: true,
                                              onSelectedItemChanged: (index) =>
                                                  setState(
                                                      () => monthIndex = index),
                                              // selectionOverlay: Container(),
                                              selectionOverlay:
                                                  CupertinoPickerDefaultSelectionOverlay(
                                                background: COLORS.blueDark
                                                    .withOpacity(0.12),
                                              ),
                                              children:
                                                  Utils.modelBuilder<String>(
                                                months,
                                                (monthIndex, month) {
                                                  final isSelected =
                                                      monthIndex == monthIndex;
                                                  final color = isSelected
                                                      ? COLORS.blueDark
                                                      : Colors.black;
                                                  return Center(
                                                    child: Text(
                                                      month,
                                                      style: TextStyle(
                                                          color: color,
                                                          fontSize: 24),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 300,
                                            width: SizeConfig.blockWidth * 30,
                                            child: CupertinoPicker(
                                              itemExtent: 64,
                                              diameterRatio: 0.7,
                                              looping: true,
                                              onSelectedItemChanged: (index) =>
                                                  setState(
                                                      () => dayIndex = index),
                                              // selectionOverlay: Container(),
                                              selectionOverlay:
                                                  CupertinoPickerDefaultSelectionOverlay(
                                                background: COLORS.blueDark
                                                    .withOpacity(0.12),
                                              ),
                                              children:
                                                  Utils.modelBuilder<String>(
                                                days,
                                                (dayIndex, day) {
                                                  final isSelected =
                                                      dayIndex == dayIndex;
                                                  final color = isSelected
                                                      ? COLORS.blueDark
                                                      : Colors.black;
                                                  return Center(
                                                    child: Text(
                                                      day,
                                                      style: TextStyle(
                                                          color: color,
                                                          fontSize: 24),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onClicked: () {
                                      stateState(() {
                                        day = days[dayIndex];
                                        month = months[monthIndex];
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$month",
                                      style: TextStyle(
                                          color: Color(0xff0F203C),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockWidth * 4.5),
                                    ),
                                    Text(
                                      " $day ",
                                      style: TextStyle(
                                          color: Color(0xff0F203C),
                                          fontFamily: "Roboto",
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.blockWidth * 4.5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 3.5),
                            Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Select Time",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Color(0xff0F203C),
                                      fontWeight: FontWeight.w400,
                                      fontSize: SizeConfig.blockWidth * 4),
                                )),
                            SizedBox(height: SizeConfig.blockHeight * 1),
                            Container(
                              width: SizeConfig.blockWidth * 85,
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  Utils.showSheet(
                                    context,
                                    child: Container(
                                      width: SizeConfig.blockWidth * 70,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 300,
                                            width: SizeConfig.blockWidth * 20,
                                            child: CupertinoPicker(
                                              itemExtent: 64,
                                              diameterRatio: 0.7,
                                              looping: true,
                                              onSelectedItemChanged: (index) =>
                                                  setState(
                                                      () => hourIndex = index),
                                              // selectionOverlay: Container(),
                                              selectionOverlay:
                                                  CupertinoPickerDefaultSelectionOverlay(
                                                background: COLORS.blueDark
                                                    .withOpacity(0.12),
                                              ),
                                              children:
                                                  Utils.modelBuilder<String>(
                                                hours,
                                                (hourIndex, hour) {
                                                  final isSelected =
                                                      hourIndex == hourIndex;
                                                  final color = isSelected
                                                      ? COLORS.blueDark
                                                      : Colors.black;
                                                  return Center(
                                                    child: Text(
                                                      hour,
                                                      style: TextStyle(
                                                          color: color,
                                                          fontSize: 24),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 300,
                                            width: SizeConfig.blockWidth * 20,
                                            child: CupertinoPicker(
                                              itemExtent: 64,
                                              diameterRatio: 0.7,
                                              looping: true,
                                              onSelectedItemChanged: (index) =>
                                                  setState(
                                                      () => minIndex = index),
                                              // selectionOverlay: Container(),
                                              selectionOverlay:
                                                  CupertinoPickerDefaultSelectionOverlay(
                                                background: COLORS.blueDark
                                                    .withOpacity(0.12),
                                              ),
                                              children:
                                                  Utils.modelBuilder<String>(
                                                mins,
                                                (minIndex, min) {
                                                  final isSelected =
                                                      minIndex == minIndex;
                                                  final color = isSelected
                                                      ? COLORS.blueDark
                                                      : Colors.black;
                                                  return Center(
                                                    child: Text(
                                                      min,
                                                      style: TextStyle(
                                                          color: color,
                                                          fontSize: 24),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 300,
                                            width: SizeConfig.blockWidth * 20,
                                            child: CupertinoPicker(
                                              itemExtent: 64,
                                              diameterRatio: 0.7,
                                              looping: false,
                                              onSelectedItemChanged: (index) =>
                                                  setState(
                                                      () => apIndex = index),
                                              // selectionOverlay: Container(),
                                              selectionOverlay:
                                                  CupertinoPickerDefaultSelectionOverlay(
                                                background: COLORS.blueDark
                                                    .withOpacity(0.12),
                                              ),
                                              children:
                                                  Utils.modelBuilder<String>(
                                                aps,
                                                (apIndex, ap) {
                                                  final isSelected =
                                                      apIndex == apIndex;
                                                  final color = isSelected
                                                      ? COLORS.blueDark
                                                      : Colors.black;
                                                  return Center(
                                                    child: Text(
                                                      ap,
                                                      style: TextStyle(
                                                          color: color,
                                                          fontSize: 24),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    onClicked: () {
                                      stateState(() {
                                        hour = hours[hourIndex];
                                        min = mins[minIndex];
                                        ap = aps[apIndex];
                                      });
                                      Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Text(
                                  "$hour: $min $ap",
                                  style: TextStyle(
                                      color: Color(0xff0F203C),
                                      fontFamily: "Roboto",
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.blockWidth * 4.5),
                                ),
                              ),
                            ),
                            SizedBox(height: SizeConfig.blockHeight * 4.5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                matButton(
                                    title: "Cancel",
                                    buttonColor: Colors.white,
                                    icon: Icons.cancel,
                                    textColor: Color(0xff0F203C),
                                    borderColor: Color(0xff0F203C),
                                    onPress: () => {Navigator.pop(context)}),
                                SizedBox(width: SizeConfig.blockWidth * 5),
                                matButton(
                                    title: "Confirm",
                                    buttonColor: Color(0xff0F203C),
                                    icon: Icons.check_circle_outline,
                                    textColor: Colors.white,
                                    onPress: () {
                                      Navigator.pop(context);
                                      tripScheduledSuccessfully(
                                          context, "Schedule Pick Up");
                                    })
                              ],
                            ),
                          ],
                        ),
                      );
                    });
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
      {required String title,
      required IconData icon,
      required Color buttonColor,
      required Color textColor,
      Color? borderColor,
      double? minwidth,
      required VoidCallback onPress}) {
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
}
