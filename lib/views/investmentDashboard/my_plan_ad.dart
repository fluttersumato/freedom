import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';
import '../../providers/my_plans_provider.dart';
import '../../providers/theme_provider.dart';
import '../../styles/app_styles.dart';
import '../../utils/img_path.dart';
import '../widgets/blur_row.dart';

class MyPlanAd extends StatelessWidget {
  final String backgroundImgPath;
  final String planIconPath;
  final String planName;
  final int annualROI;
  final double investmentAmount;
  final int period, vpsClass, riskProfile,id;

  final Decoration iconDecoration, btnDecoration;
  final Color blurRowColor;
  final bool isVisibleSubscribeBtn, isSubscribed;

  const MyPlanAd(
      {super.key,
       this.id=0,
      required this.backgroundImgPath,
      required this.planIconPath,
      required this.iconDecoration,
      required this.planName,
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
      shape: AppStyles.borderShapeForCards,
      color: isDarkMode ? Colors.black : Colors.white,
      child: Stack(
        children: [
          Image.asset(
            backgroundImgPath,
            width: 420,
            height: 272,
            fit: BoxFit.fill,
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
                    Container(
                      padding: const EdgeInsets.all(0),
                      decoration: iconDecoration,
                      child: Image.asset(
                        planIconPath,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    const AddHorizontalSpace(width: 10),
                    Text(
                      planName,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Expanded(child: Container()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Investment from',
                          style: isDarkMode
                              ? AppStyles.planAdStyleD
                              : AppStyles.planAdStyleL,
                          textAlign: TextAlign.start,
                        ),
                        const AddVerticalSpace(height: 5),
                        Text(
                          '\$$investmentAmount',
                          style: isDarkMode
                              ? AppStyles.planAdBoldStyleD
                              : AppStyles.planAdBoldStyleL,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),

                const AddVerticalSpace(height: 75),
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
                const AddVerticalSpace(height: 17),
                isVisibleSubscribeBtn
                    ? GestureDetector(
                  onTap: () async {

                   await context.read<MyPlansProvider>().subscribeNowBtn(context:context,id:id);
                  },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          // height: 50,
                          decoration: btnDecoration,
                          child: Center(
                            child: Consumer<MyPlansProvider>(
                                builder: (context, planP, child) {
                              return Text(
                                isSubscribed ? 'Subscribed' : 'Subscribe Now',
                                style: isDarkMode
                                    ? AppStyles.planAdStyleD
                                    : AppStyles.planAdStyleL,
                              );
                            }),
                          ),
                        ),
                    )
                    : Consumer<MyPlansProvider>(
                        builder: (context, planP, child) {
                        return GestureDetector(
                          onTap: () {
                            planP.setTab(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            // height: 50,
                            decoration: btnDecoration,
                            child: Center(
                                child: Text(
                              'Upgrade to  $planName',
                              style: isDarkMode
                                  ? AppStyles.planAdStyleD
                                  : AppStyles.planAdStyleL,
                            )),
                          ),
                        );
                      }),

                // const AddVerticalSpace(height: 10),
              ],
            ),
          ),
          Positioned(
            top: 68,
            left: 10,
            right: 12,
            child: BlurredRowWidget(
              height: 52,
              cornerRadius: 0,
              color: blurRowColor,
            ),
          ),
          Positioned(
            top: 85,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Expected Annual',
                  style: isDarkMode
                      ? AppStyles.planAdStyleD
                      : AppStyles.planAdStyleL,
                  textAlign: TextAlign.start,
                ),
                Expanded(child: Container()),
                // const AddVerticalSpace(height: 5),

                Text(
                  'ROI $annualROI%',
                  style: isDarkMode
                      ? AppStyles.planAdBoldStyleD
                      : AppStyles.planAdBoldStyleL,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
