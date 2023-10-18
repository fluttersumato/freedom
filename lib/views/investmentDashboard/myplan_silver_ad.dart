import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/colors.dart';
import '../../styles/app_styles.dart';
import '../../utils/img_path.dart';
import '../widgets/add_space.dart';

class MyPlanSilverAd extends StatefulWidget {
  const MyPlanSilverAd({super.key});


  @override
  State<MyPlanSilverAd> createState() => _MyPlanSilverAdState();
}

class _MyPlanSilverAdState extends State<MyPlanSilverAd> {


  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    return Card(
      elevation: 3.0,
      shape: AppStyles.cardShape,
      color: isDarkMode ? Colors.black : Colors.white,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: Image.asset(
              isDarkMode
                  ? ImgP.silverAdD
                  : ImgP.silverAdL,
              width: 420,
              height: 245,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Card(
                      shape: AppStyles.cardShapeSilverAd,
                      color: AppC.silverIconBackground,
                      // padding: const EdgeInsets.all(8),
                      // decoration: AppStyles.planIconContainerStyle,
                      child: Image.asset(
                        ImgP.silverBasicIcon,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    Card(
                      shape: AppStyles.cardShapeSilverAd,
                      color: AppC.silverIconBackground,
                      // padding: const EdgeInsets.all(8),
                      // decoration: AppStyles.planIconContainerStyle,
                      child: Image.asset(
                        ImgP.silverAdvanceIcon,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    Card(
                      shape: AppStyles.cardShapeSilverAd,
                      color: AppC.silverIconBackground,
                      // padding: const EdgeInsets.all(8),
                      // decoration: AppStyles.planIconContainerStyle,
                      child: Image.asset(
                        ImgP.silverProIcon,
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
                const AddVerticalSpace(height: 10),
                Text(
                  'Silver Products',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const AddVerticalSpace(height: 10),
                Text(
                  'Upgrade on Silver product with better expected annual ROIs and more significant risk profit. With Basic, Advanced and Pro products, the minimum investment amount is as low as \$300. With money and risk management, Silver is upgradeable.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const AddVerticalSpace(height: 17),
                Container(
                  padding: const EdgeInsets.all(10),
                  // height: 50,
                  decoration: AppStyles.btnSilverUpgradeStyle,
                  child: Center(
                      child: Text(
                    'Upgrade to Silver',
                    style: isDarkMode
                        ? AppStyles.planAdStyleD
                        : AppStyles.planAdStyleL,
                  )),
                ),
                // const AddVerticalSpace(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
