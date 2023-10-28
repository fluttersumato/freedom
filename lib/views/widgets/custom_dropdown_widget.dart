import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final String value;
  final Function(String) onChanged;

  const CustomDropdownWidget({super.key,
    required this.labelText,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  CustomDropdownWidgetState createState() => CustomDropdownWidgetState();
}

class CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      child: InputDecorator(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: widget.labelText,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: widget.value,
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            ))
                .toList(),
            onChanged: (item) {
              widget.onChanged(item ?? "");
            },
          ),
        ),
      ),
    );
  }
}
