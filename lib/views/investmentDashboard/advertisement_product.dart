import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../styles/app_styles.dart';
import '../../utils/img_path.dart';

class AdvertisementProduct extends StatelessWidget {
  final String backgroundImgPath;
  final String planIconPath;
  final String planName, planDescription;
  final int annualROI;
  final double investmentAmount;
  final int period, vpsClass, riskProfile, id;

  final Decoration iconDecoration, btnDecoration;
  final Color blurRowColor;
  final bool isVisibleSubscribeBtn, isSubscribed;

  const AdvertisementProduct(
      {super.key,
      this.id = 0,
      required this.backgroundImgPath,
      required this.planIconPath,
      required this.iconDecoration,
      required this.planName,
      required this.planDescription,
      required this.annualROI,
      required this.investmentAmount,
      required this.period,
      required this.vpsClass,
      required this.riskProfile,
      required this.blurRowColor,
      required this.btnDecoration,
      required this.isVisibleSubscribeBtn,
      this.isSubscribed = false});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(
          color: Colors.grey, // Set the border color here
          width: 1.5, // Set the border width here
        ), // Adjust the radius as needed
      ),
      color: isDarkMode ? Colors.black : Colors.white,
      child: Stack(
        children: [
          Container(
            // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
            child: Image.asset(
              backgroundImgPath,
              width: 344,
              height: 160,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: iconDecoration,
                      child: Image.asset(
                        planIconPath,
                        width: 35,
                        height: 35,
                      ),
                    ),

                  ],
                ),

                const AddVerticalSpace(height: 15),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Expected Annual ROI $annualROI%',
                                  style: isDarkMode
                                      ? AppStyles.planAdStyleD
                                      : AppStyles.planAdStyleL,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'VPS Class $vpsClass',
                                  style: isDarkMode
                                      ? AppStyles.planAdStyleD
                                      : AppStyles.planAdStyleL,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Risk Profile $riskProfile%',
                                    style: isDarkMode
                                        ? AppStyles.planAdStyleD
                                        : AppStyles.planAdStyleL,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Risk Management',
                                    style: isDarkMode
                                        ? AppStyles.planAdStyleD
                                        : AppStyles.planAdStyleL,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    SizedBox(
                      height: 80,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Investment from \$$investmentAmount ',
                                    style: isDarkMode
                                        ? AppStyles.planAdStyleD
                                        : AppStyles.planAdStyleL,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Period $period Month',
                                    style: isDarkMode
                                        ? AppStyles.planAdStyleD
                                        : AppStyles.planAdStyleL,
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                child: Text(
                                  'Money Management',
                                  style: isDarkMode
                                      ? AppStyles.planAdStyleD
                                      : AppStyles.planAdStyleL,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                isDarkMode ? ImgP.ticCircleL : ImgP.ticCircleD,
                                width: 15,
                                height: 15,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    'Upgradable',
                                    style: isDarkMode
                                        ? AppStyles.planAdStyleD
                                        : AppStyles.planAdStyleL,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // const AddVerticalSpace(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 9,
            left: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  planName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                AddVerticalSpace(height: 2),
                Text(
                  planDescription,
                  style: TextStyle(fontSize: 8),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
