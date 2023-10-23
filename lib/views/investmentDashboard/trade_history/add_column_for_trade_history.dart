import 'package:flutter/material.dart';

class AddRowForTradeHistory extends StatelessWidget {
  final String title;
  final double verticalSpace;
  final String value;

  AddRowForTradeHistory({
    required this.title,
    required this.verticalSpace,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 9,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.0,
                // Set the height to 1.0 for default line height
              ),
            ),
            SizedBox(
                height: verticalSpace), // Use a SizedBox for vertical space
            Text(
              textAlign: TextAlign.start,
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.0,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}
