import 'package:flutter/material.dart';
import '../res/colors.dart';

class AppStyles {
  /*static ButtonStyle disableButtonStyle1=ButtonStyle(
  backgroundColor: MaterialStateProperty.all<Color>(
      AppColors.disable),
    // Replace with your color
  );*/
  static ButtonStyle cancelButtonStyle = ButtonStyle(
    backgroundColor:
        MaterialStateProperty.all<Color>(Colors.transparent), // BackgroundColor
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // CornerRadius
        side: const BorderSide(
          color: Color(0xFF3598DB), // BorderColor
          width: 1.0, // BorderWidth
        ),
      ),
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(vertical: 12), // Padding
    ),

    textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(
        fontSize: 12, // FontSize
        // You can add any additional text style properties here
      ),
    ),
    elevation: MaterialStateProperty.all<double>(0),
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (states) {
        if (states.contains(MaterialState.pressed)) {
          // When the button is pressed
          return Colors.black; // TextColor
        }
        return Colors.black; // TextColor
      },
    ),
    // TextTransform is not supported in Flutter ButtonStyle
  );
  static ButtonStyle setCancelButtonStyle(bool isDarkMode) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          Colors.transparent), // BackgroundColor
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // CornerRadius
          side: const BorderSide(
            color: Color(0xFF3598DB), // BorderColor
            width: 1.0, // BorderWidth
          ),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12), // Padding
      ),

      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 12, // FontSize
          // You can add any additional text style properties here
        ),
      ),
      elevation: MaterialStateProperty.all<double>(0),
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            // When the button is pressed
            return isDarkMode ? AppC.white : AppC.black; // TextColor
          }
          return isDarkMode ? AppC.white : AppC.black; // TextColor
        },
      ),
      // TextTransform is not supported in Flutter ButtonStyle
    );
  }

  static ButtonStyle setButtonGradientStyle(bool isDarkMode) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            // When the button is pressed
            return const Color(0xFF095384); // Use the pressed color
          }
          return const Color(0xFF095384); // Use the default color
        },
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // CornerRadius
          side: const BorderSide(
            color: Colors.transparent, // Border color
            width: 1, // Border width
          ),
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12), // Padding
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 12,

          // FontSize
          // You can add any additional text style properties here
        ),
      ),
      elevation: MaterialStateProperty.all<double>(0), // Elevation
      foregroundColor: MaterialStateProperty.resolveWith<Color>(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            // When the button is pressed
            return Colors.white; // TextColor
          }
          return Colors.white; // TextColor
        },
      ),
    );
  }

  /*static TextStyle setSimpleTextStylo(bool isDarkMode){

    return ;
  } */
  static ButtonStyle setDisableButtonStyle(bool isDarkMode) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
          isDarkMode ? AppC.disableD : AppC.disableL),
      foregroundColor: MaterialStateProperty.all<Color>(
        isDarkMode ? AppC.white : AppC.disableTextC,
      ), // Text color
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 12,
          // Add any other text style properties as needed
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(vertical: 12),
      ),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          color: Colors.black, // Border color
          width: 1, // Border width
        ),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Border radius
        ),
      ),
    );
  }

  static ShapeBorder cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    side: const BorderSide(
      color: Colors.grey, // Set the border color here
      width: 1.5, // Set the border width here
    ), // Adjust the radius as needed
  );
  static ShapeBorder cardShapeSilverAd = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(7),
      bottomRight: Radius.circular(7),
    ),
    side: BorderSide(
      color: Colors.grey, // Set the border color here
      width: 1.5, // Set the border width here
    ), // Adjust the radius as needed
  );

  static Decoration setIconContainerStyle({required bool isDarkMode}) {
    return BoxDecoration(
      color: isDarkMode ? AppC.blue : AppC.white, // Background color
      border: Border.all(color: AppC.borderColor),
      // Border color
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }

  static Decoration planIconContainerStyle = BoxDecoration(
    color: AppC.standardPlanIconColor, // Background color
    border: Border.all(color: AppC.borderColor),
    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
  static Decoration getCustomProductIconBackground(
      {required Color color, bool isPlanStandard = false}) {
    if (isPlanStandard) {
      return BoxDecoration(
        color: color, // Background color
        border: Border.all(color: Colors.transparent),
        // Border color
        borderRadius: const BorderRadius.all(
          Radius.circular(7),
        ),
      );
    } else {
      return BoxDecoration(
        color: color, // Background color
        border: Border.all(color: Colors.transparent),
        // Border color

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
      );
    }
  }

  static Decoration setAdvertisementBtnDecoration(
      {required Color color, bool isPlanStandard = false}) {
    if (isPlanStandard) {
      return BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: color),

        // Border color
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      );
    } else {
      return BoxDecoration(
        color: color.withOpacity(0.3),
        border: Border.all(color: color),

        // Border color
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      );
    }
  }


  static Decoration getCustomDecorationForTradeStatus(Color color) {
    return BoxDecoration(
      color: color, // Background color
      border: Border.all(color: AppC.primaryColor), // Border color
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }

  static Decoration tradeStatusContainerStyle = BoxDecoration(
    color: Colors.red, // Background color
    border: Border.all(color: AppC.primaryColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration setActionBarContainerStyle({required bool isDarkMode}) {
    return BoxDecoration(
      border: Border.all(
          color:
              isDarkMode ? AppC.borderColor : AppC.borderColor), // Border color
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      gradient: isDarkMode
          ? const LinearGradient(
              colors: [AppC.blue, AppC.blue],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)
          : const LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.0, 1.0),
              colors: [
                Color(0xFF092F48), // Replace with your color code
                // Color(0xFF094728), // Replace with your color code
                Color(0xFF092f48), // Replace with your color code
              ],
              stops: [0.0, 1.0],
            ),
    );
  }


  static Decoration btnStartContainerStyle = BoxDecoration(
    color: AppC.startTradeBtnColor.withOpacity(0.3),
    border: Border.all(color: AppC.startTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnStartedContainerStyle = BoxDecoration(
    color: AppC.startTradeBtnColor.withOpacity(1),
    border: Border.all(color: AppC.startTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnUpgradeStyle = BoxDecoration(
    color: AppC.adUpgradeBtn.withOpacity(0.3),
    border: Border.all(color: AppC.adUpgradeBtn),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnSilverUpgradeStyle = BoxDecoration(
    color: AppC.silverBtnBackground.withOpacity(0.3),
    border: Border.all(color: AppC.silverBtnBackground),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );

  static Decoration btnPauseContainerStyle = BoxDecoration(
    color: AppC.pauseTradeBtnColor.withOpacity(0.3),
    border: Border.all(color: AppC.pauseTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnPausedContainerStyle = BoxDecoration(
    color: AppC.pauseTradeBtnColor.withOpacity(1),
    border: Border.all(color: AppC.pauseTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnStopContainerStyle = BoxDecoration(
    color: AppC.stopTradeBtnColor.withOpacity(0.3),
    border: Border.all(color: AppC.stopTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static Decoration btnStoppedContainerStyle = BoxDecoration(
    color: AppC.stopTradeBtnColor.withOpacity(1),
    border: Border.all(color: AppC.stopTradeBtnColor),

    // Border color
    borderRadius: const BorderRadius.all(
      Radius.circular(5),
    ),
  );
  static TextStyle planAdStyleD =  const TextStyle(color: AppC.white);
  static TextStyle planAdStyleL =  TextStyle(color: AppC.black);
  static TextStyle planAdBoldStyleD =
      const TextStyle(color: AppC.white, fontWeight: FontWeight.bold);
  static TextStyle planAdBoldStyleL =
       TextStyle(color: AppC.black, fontWeight: FontWeight.bold);
  static BoxDecoration linearGradient = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
      stops: [0.0, 2.2589],
      colors: [
        Color(0xFF092F48),
        Color.fromRGBO(9, 47, 72, 0.93),
      ],
    ),
  );

  // Define your text styles here
  static const TextStyle largeTextStyle = TextStyle(
    color: Colors.black, // Default text color
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mediumTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle smallTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // static Decoration iconContainerStyleL =iconContainerStyleD.copyWith( color: AppColors.white,);

  // Define your themes here

  static ThemeData lightTheme = ThemeData(
    /*   checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
            (states) {
          if (states.contains(MaterialState.selected)) {
            // return Colors.purple // the color when checkbox is selected;
            return Colors.blue ;// the color when checkbox is selected;
          }
          return Colors.orange ;//the color when checkbox is unselected;
        },
      ),
    ),*/
    primaryColor: Colors.blue,
    hintColor: Colors.orange,
    textTheme: const TextTheme(
      bodySmall: smallTextStyle,
      bodyMedium: mediumTextStyle,
      bodyLarge: largeTextStyle,
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      // backgroundColor: Colors.green,
      color: Colors.transparent,
      actionsIconTheme: IconThemeData(
        color: Colors.red,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    hintColor: Colors.purple,
    textTheme: TextTheme(
      bodySmall: smallTextStyle.copyWith(color: Colors.white),
      bodyMedium: mediumTextStyle.copyWith(color: Colors.white),
      bodyLarge: largeTextStyle.copyWith(color: Colors.white),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      actionsIconTheme: IconThemeData(
        color: Colors.red,
      ),
    ),
  );
}
