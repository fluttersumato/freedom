import 'package:flutter/cupertino.dart';

class AddVerticalSpace extends StatelessWidget {
  final double height;
  const AddVerticalSpace({super.key,required this.height});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
    );
  }
}

class AddHorizontalSpace extends StatelessWidget {
  final double width;
  const AddHorizontalSpace({super.key,required this.width});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
    );
  }
}

