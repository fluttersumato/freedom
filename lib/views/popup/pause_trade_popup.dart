import 'package:flutter/material.dart';
import 'package:freedom/providers/theme_provider.dart';
import 'package:freedom/res/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/my_plans_provider.dart';
import '../../styles/app_styles.dart';
import '../widgets/add_space.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/loading_indicator_widget.dart';

class CustomDialog extends StatelessWidget {
  // final Function(BuildContext context) callbackBtnDone;
  final Function callbackBtnDone;
  // final Function(String) callback;
  final String type, title, checkBoxText;

  const CustomDialog(
      {required this.callbackBtnDone,
      required this.type,
      required this.title,
      required this.checkBoxText,
      super.key});

  @override
  Widget build(BuildContext context) {
    // bool isCheckboxChecked = false;
    return Align(
      alignment: Alignment.center,
      child: Consumer<ThemeProvider>(builder: (context, themeP, child) {
        return Container(
          height: 250,
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
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue, // Replace with your color
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: const Center(
                          child: Text(
                            '!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        type,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
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
                      title,
                      style: const TextStyle(
                        fontSize: 14,

                        // Replace with your text style
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 7.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(

                        margin: const EdgeInsets.only(left: 4, right: 4),
                        child: Consumer<MyPlansProvider>(
                            builder: (context, planP, child) {
                          return CustomCheckbox(
                            value: planP.isCheckboxChecked,
                            onChanged: (bool? value) {
                              planP.toggleCheckBox();
                            },
                            activeColor:
                                Colors.green, // Replace with your color
                            borderWidth: 2, // BorderWidth
                            cornerRadius: 5, // CornerRadius
                            fontSize: 12, // FontSize
                            textColor: Colors.green, // TextColor
                            checkedColor:
                                const Color(0xFF3598DB), // CheckedColor
                            uncheckedColor:
                                const Color(0xFF3598DB), // UncheckedColor
                          );
                        }),
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Consumer<ThemeProvider>(
                            builder: (context, themeP, child) {
                          return Text(
                            checkBoxText,
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                    themeP.isDarkMode ? AppC.white : AppC.black
                                // Replace with your text style
                                ),
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Consumer<ThemeProvider>(
                            builder: (context, themeP, child) {
                          return ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            style: AppStyles.setCancelButtonStyle(
                                themeP.isDarkMode), // Replace with your color

                            child: const Text('Cancel'),
                          );
                        }),
                      ),
                      const AddHorizontalSpace(width: 5),
                      Expanded(
                        child: Consumer<ThemeProvider>(
                            builder: (context, themeP, child) {
                          return ElevatedButton(
                            onPressed: context
                                    .watch<MyPlansProvider>()
                                    .isCheckboxChecked
                                ? () {
                                    // Handle done button click
                                    // Trigger the callback function when the button is pressed.
                                    // Navigator.of(context).pop();
                                    callbackBtnDone();
                                  }
                                : null, // Disable the button if the checkbox is not checked
                            style: context
                                    .watch<MyPlansProvider>()
                                    .isCheckboxChecked
                                ? AppStyles.setButtonGradientStyle(
                                    themeP.isDarkMode)
                                : AppStyles.setDisableButtonStyle(
                                    themeP.isDarkMode),

                            child: const Text('Done'),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              LoadingIndicatorWidget(isLoading:context.watch<MyPlansProvider>().isLoading),
            ],
          ),
        );
      }),
    );
  }

  /*Widget contentBox(BuildContext context) {
    return
  }*/
}
