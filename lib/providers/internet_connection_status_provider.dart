import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../views/popup/congrats_popup.dart';
import '../views/popup/internet_disconnect_popup.dart';

class ConnectivityProvider with ChangeNotifier {
  late StreamSubscription<ConnectivityResult> subscription;

  bool _isInternetConnected = true;
  bool isDisconnectedDialogVisible = false;

  bool get isInternetConnected => _isInternetConnected;

  void  listenInternetConnectivity( BuildContext context) {

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      updateConnectionStatus(result);
      if (!isInternetConnected) {
        showDisconnectedDialog(context);
      } else {
        hideDisconnectedDialog(context);
      }
    });
  }

  void updateConnectionStatus(ConnectivityResult result) {
    _isInternetConnected = (result != ConnectivityResult.none);
    notifyListeners();
  }

  void showDisconnectedDialog(BuildContext context) {
    if (!isDisconnectedDialogVisible) {
      isDisconnectedDialogVisible = true;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const InternetDisconnectDialog();
         /* return CongratsDistributorPopup(
              isSuccess: true,
              title: StringCons.tradeStartPopupTitle,
              description: StringCons.tradeStartPopupDesc);*/
        },
      );
    }
  }

  void hideDisconnectedDialog(BuildContext context) {
    if (isDisconnectedDialogVisible) {
      isDisconnectedDialogVisible = false;
      Navigator.of(context).pop(); // Dismiss the dialog
    }
  }

}
