import 'package:bloc_patter_example_app/components/size_config.dart';
import 'package:bloc_patter_example_app/components/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class CustomMonthPicker extends StatefulWidget {
  final monthIndex;
  const CustomMonthPicker({Key key, this.monthIndex}) : super(key: key);

  @override
  _CustomMonthPickerState createState() =>
      _CustomMonthPickerState(this.monthIndex);
}

class _CustomMonthPickerState extends State<CustomMonthPicker> {
  int monthIndex;

  static List<String> months = [
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

  _CustomMonthPickerState(this.monthIndex);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: SizeConfig.blockWidth * 30,
      child: CupertinoPicker(
        itemExtent: 64,
        diameterRatio: 0.7,
        looping: true,
        onSelectedItemChanged: (index) =>
            setState(() => this.monthIndex = index),
        // selectionOverlay: Container(),
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: COLORS.blueDark.withOpacity(0.12),
        ),
        children: Utils.modelBuilder<String>(
          months,
          (monthIndex, month) {
            final isSelected = this.monthIndex == monthIndex;
            final color = isSelected ? COLORS.blueDark : Colors.black;
            return Center(
              child: Text(
                month,
                style: TextStyle(color: color, fontSize: 24),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget buildCustomMonthPicker() {
//   return SizedBox(
//     height: 300,
//     width: SizeConfig.blockWidth * 30,
//     child: CupertinoPicker(
//       itemExtent: 64,
//       diameterRatio: 0.7,
//       looping: true,
//       onSelectedItemChanged: (index) => setState(() => this.monthIndex = index),
//       // selectionOverlay: Container(),
//       selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
//         background: Colors.pink.withOpacity(0.12),
//       ),
//       children: Utils.modelBuilder<String>(
//         months,
//         (monthIndex, month) {
//           final isSelected = this.monthIndex == monthIndex;
//           final color = isSelected ? COLORS.blueDark : Colors.black;
//           return Center(
//             child: Text(
//               month,
//               style: TextStyle(color: color, fontSize: 24),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }

class CustomDayPicker extends StatefulWidget {
  final dayIndex;
  const CustomDayPicker({Key key, this.dayIndex}) : super(key: key);

  @override
  _CustomDayPickerState createState() => _CustomDayPickerState(this.dayIndex);
}

class _CustomDayPickerState extends State<CustomDayPicker> {
  int dayIndex;

  static List<String> days = [];

  _CustomDayPickerState(this.dayIndex);

  void buildDays() {
    for (int i = 1; i <= 31; i++) {
      days.add(i.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    buildDays();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: SizeConfig.blockWidth * 30,
      child: CupertinoPicker(
        itemExtent: 64,
        diameterRatio: 0.7,
        looping: true,
        onSelectedItemChanged: (index) => setState(() => this.dayIndex = index),
        // selectionOverlay: Container(),
        selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
          background: COLORS.blueDark.withOpacity(0.12),
        ),
        children: Utils.modelBuilder<String>(
          days,
          (dayIndex, day) {
            final isSelected = dayIndex == dayIndex;
            final color = isSelected ? COLORS.blueDark : Colors.black;
            return Center(
              child: Text(
                day,
                style: TextStyle(color: color, fontSize: 24),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Widget buildCustomDayPicker() {
//   return SizedBox(
//     height: 300,
//     width: SizeConfig.blockWidth * 30,
//     child: CupertinoPicker(
//       itemExtent: 64,
//       diameterRatio: 0.7,
//       looping: true,
//       onSelectedItemChanged: (index) => setState(() => dayIndex = index),
//       // selectionOverlay: Container(),
//       selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
//         background: COLORS.blueDark.withOpacity(0.12),
//       ),
//       children: Utils.modelBuilder<String>(
//         days,
//         (dayIndex, day) {
//           final isSelected = dayIndex == dayIndex;
//           final color = isSelected ? COLORS.blueDark : Colors.black;
//           return Center(
//             child: Text(
//               day,
//               style: TextStyle(color: color, fontSize: 24),
//             ),
//           );
//         },
//       ),
//     ),
//   );
// }
