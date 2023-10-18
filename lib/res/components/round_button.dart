import 'package:flutter/material.dart';

import '../colors.dart';

class RoundButton extends StatelessWidget {
  // const RoundButton({Key? key}) : super(key: key);

  final String title;
  final bool loading;

  final VoidCallback onPress;

  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: const BoxDecoration(
          color: AppC.primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        height: 40,
        width: 200,
        child: Center(
          child: loading
              ? const CircularProgressIndicator(
                  color: AppC.white,
                )
              : Text(
                  title,
                  style: const TextStyle(color: AppC.white),
                ),
        ),
      ),
    );
  }
}
