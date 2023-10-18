import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/colors.dart';

class CustomAlertDialog extends StatelessWidget {

  late final String? _title, _content, _yes;

  CustomAlertDialog(
      {super.key,
      required String title,
      required String content,
      String yes = "Yes",
      String no = "No"}) {
    _title = title;
    _content = content;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeP, child) {
      return AlertDialog(
        title: Center(child: Text(_title as String)),
        content: Text(_content as String),
        backgroundColor: themeP.isDarkMode ? AppC.black : AppC.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Ok',
              style: TextStyle(
                color: Colors.greenAccent,
              ),
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pop(); // dismisses only the dialog and returns nothing
            },
          ),
        ],
      );
    });
  }
}
