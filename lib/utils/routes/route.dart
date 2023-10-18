
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint("generateRoute: ${settings.name}");
    switch (settings.name) {
    /*
      case RouteName.home:
        // final prefs = await SharedPreferences.getInstance();
        // SignUpModel? signUpModel = json.decode(prefs.getString('userModel')!);
        return MaterialPageRoute(
            builder: (BuildContext context) => const CustomerHomeView());

        case RouteName.adminHome:
        debugPrint("================get adin route=============");

       return MaterialPageRoute(
            builder: (BuildContext context) => const HomeView());
      case RouteName.firebase:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FirebaseView());
      case RouteName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RouteName.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignupView());*/
     /* case RouteName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());*/
  /*    case RouteName.bustracking:
        return MaterialPageRoute(
            builder: (BuildContext context) => const BusTrackingView());
      case RouteName.map:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MapView());*/
     /* case RouteName.onboarding:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OnboardingView());*/
 /*     case RouteName.manageStudents:
        return MaterialPageRoute(
            builder: (BuildContext context) => const StudentsView());
      case RouteName.giveFeedback:
        return MaterialPageRoute(
            builder: (BuildContext context) => const FeedbackStudentsView());

      case RouteName.manageFeedbackView:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ManageFeedbackView());*/
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route defined'),
            ),
          );
        });
    }
  }

  static const String home = 'home_screen';
}
