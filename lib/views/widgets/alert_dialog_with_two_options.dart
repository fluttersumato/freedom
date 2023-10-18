import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/colors.dart';

class AlertDialogWithTwoOptions extends StatelessWidget {
  //When creating please recheck 'context' if there is an error!


  late final String? _title, _content, _yes, _no;
  late final Function _yesOnPressed;
  late final Function _noOnPressed;

  AlertDialogWithTwoOptions(
      {super.key,
      required String title,
      required String content,
      required Function yesOnPressed,
      required Function noOnPressed,
      String yes = "Yes",
      String no = "No"}) {
    _title = title;
    _content = content;
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeP, child) {
      return AlertDialog(
        title: Text(_title as String),
        content: Text(_content as String),
        backgroundColor:themeP.isDarkMode? AppC.black:AppC.white ,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        actions: <Widget>[
          TextButton(
            child: Text(
              _yes as String,
              style: const TextStyle(
                color: Colors.greenAccent,
              ),
            ),
            onPressed: () {
              _yesOnPressed();
            },
          ),
          TextButton(
            child: Text(
              _no as String,
              style: const TextStyle(
                color: Colors.greenAccent,
              ),
            ),
            onPressed: () {
              _noOnPressed();
            },
          ),
        ],
      );
    });
  }
}
