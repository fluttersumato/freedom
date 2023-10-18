import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../res/colors.dart';

class BlurredRowWidget extends StatelessWidget {
  final double height;
  final double cornerRadius;
  final Color color;



  // this.colorD=AppC.whiteWith_0_1Opacity,
  const BlurredRowWidget({super.key, required this.height, required this.cornerRadius, this.color= AppC.blackWith_0_1Opacity,

  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode=context.watch<ThemeProvider>().isDarkMode;
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        color:color,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cornerRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX:isDarkMode? 11.5:8.5, sigmaY:isDarkMode? 11.5:8.5),
          child: Container(), // Empty container, no children
        ),
      ),
    );
  }
}




