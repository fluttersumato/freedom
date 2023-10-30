import 'package:flutter/material.dart';

import '../../utils/img_path.dart';

class CustomField extends StatelessWidget {
  final String hintText, tooltipMessage;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final bool displayTooltip;

  const CustomField({
    super.key,
    required this.hintText,
    this.tooltipMessage = "",
    required this.controller,
    required this.onChanged,
    this.displayTooltip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
            ),
            controller: controller,
            onChanged: onChanged,
          ),
        ),
        if (displayTooltip)
        const SizedBox(width: 10),
        if (displayTooltip)
          Tooltip(
            triggerMode: TooltipTriggerMode.tap,
            preferBelow: false,
            message: tooltipMessage,
            child: Image.asset(ImgP.freedomBirdIcon, height: 50, width: 50),
          ),
        if (displayTooltip) const SizedBox(width: 10),
      ],
    );
  }
}
