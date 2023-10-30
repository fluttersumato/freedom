import 'package:flutter/material.dart';

import '../../utils/img_path.dart';

class CustomDatePicker extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final VoidCallback  onTap;

  const CustomDatePicker({super.key,
    required this.hintText,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            readOnly: true,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText, // Use the provided hintText
            ),
            controller: controller,
            onTap: () {
              onTap(); // Call the provided onTap method
            },
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(ImgP.calenderIcon, width: 20), // Call the provided onTap method
        ),
      ],
    );
  }
}
