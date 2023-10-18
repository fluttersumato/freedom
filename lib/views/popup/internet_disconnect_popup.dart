import 'package:flutter/material.dart';
import 'package:freedom/providers/theme_provider.dart';
import 'package:freedom/res/colors.dart';
import 'package:provider/provider.dart';
import '../../providers/my_plans_provider.dart';
import '../../utils/constants.dart';
import '../widgets/add_space.dart';
import '../widgets/loading_indicator_widget.dart';

class InternetDisconnectDialog extends StatelessWidget {
  // final Function(BuildContext context) callbackBtnDone;

  // final Function(String) callback;

  const InternetDisconnectDialog({super.key});
  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  @override
  Widget build(BuildContext context) {
    // bool isCheckboxChecked = false;
    final themeP = Provider.of<ThemeProvider>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Center(
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: themeP.isDarkMode ? Colors.black : AppC.white,
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: const Color(0xFFADADAD), // Border color
              width: 1.0, // Border width
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Material(
            child: Stack(
              children: [
                Consumer<ThemeProvider>(builder: (context, themeP, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringCons.internetDisconnectTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,

                              color:
                                  themeP.isDarkMode ? Colors.white : AppC.black,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              // Replace with your text style
                            ),
                          ),
                        ],
                      ),
                      const AddVerticalSpace(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          StringCons.internetDisconnectDescription,
                          style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color:
                                themeP.isDarkMode ? Colors.white : AppC.black,
                            // Replace with your text style
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  );
                }),
                LoadingIndicatorWidget(
                    isLoading: context.watch<MyPlansProvider>().isLoading),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
