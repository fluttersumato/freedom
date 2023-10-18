import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color activeColor;
  final double borderWidth;
  final double cornerRadius;
  final double fontSize;
  final Color textColor;
  final Color checkedColor;
  final Color uncheckedColor;

  const CustomCheckbox({super.key,
    required this.value,
    required this.onChanged,
    required this.activeColor,
    this.borderWidth = 2,
    this.cornerRadius = 5,
    this.fontSize = 12,
    this.textColor = Colors.black,
    this.checkedColor = Colors.blue,
    this.uncheckedColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 25.0,
        height: 25.0,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
           border: Border.all(
            // color: activeColor,
            color: Colors.blue, // outer Border color
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(cornerRadius),

        ),
        child: Consumer<ThemeProvider>(builder: (context, themeP, child) {
          return Checkbox(

            side: const BorderSide(
                      // color: Colors.blue, //your desire colour here
                      color: Colors.transparent, //your desire colour here
                      width: 1.0,
                    ),
            value: value,
            onChanged: onChanged,
            // activeColor: activeColor,
            activeColor: Colors.blue,
            // checkColor: textColor,
            checkColor:themeP.isDarkMode? Colors.blue:Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(
              horizontal: VisualDensity.minimumDensity,
              vertical: VisualDensity.minimumDensity,
            ),
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(cornerRadius - borderWidth),

            ),
          );
        }),
      ),
    );
  }
}
