import 'package:flutter/material.dart';

import '../../res/colors.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool isLoading;

  const LoadingIndicatorWidget({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: Colors.black.withOpacity(0.0),
          ),
          Center(
            child: CircularProgressIndicator(color: AppC.activityIndicatorColor,),
          ),
        ],
      );
    } else {
      // Return an empty container if not loading
      return Container();
    }
  }
}
