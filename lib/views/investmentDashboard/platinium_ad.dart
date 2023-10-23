import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';
import '../../providers/my_plans_provider.dart';
import '../../providers/theme_provider.dart';
import '../../styles/app_styles.dart';
import '../../utils/constants.dart';
import 'advertisement_product.dart';

class PlatinumAd extends StatelessWidget {
  const PlatinumAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<ThemeProvider>(builder: (context, themeP, child) {
          return Card(
            elevation: 3.0,
            shape: AppStyles.borderShapeForCards,
            color: themeP.isDarkMode ? Colors.black : Colors.white,
            child: SizedBox(
              height: 430,
              // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child:
              Consumer<MyPlansProvider>(builder: (context, planP, child) {
                return Image.asset(
                  planP.getAdvertisementBackgroundImage(
                      productCode:
                      'Platinum-Elite',
                      isDarkMode: themeP.isDarkMode),
                  width: 420,
                  height: 262,
                  fit: BoxFit.fill,
                );
              }),

              // padding: EdgeInsets.all(10),
            ),
          );
        }),
        Positioned(
          left: 2,
          top: 23,
          right: 2,

          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          StringCons.platinumAdTitle,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        Consumer<MyPlansProvider>(builder: (context, planP, child) {
                          return Container(
                            padding: const EdgeInsets.all(0),
                            decoration: planP.getProductIconDecoration(
                                productCode: 'Platinum-Elite'),
                            child: Image.asset(
                              planP.getProductIcon(
                                productCode: 'Platinum-Elite',
                              ),
                              width: 35,
                              height: 35,
                            ),
                          );
                        }),
                      ],
                    ),
                    const AddVerticalSpace(height: 20),
                    Text(
                      StringCons.platinumAdDescription,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    const AddVerticalSpace(height: 20),
                    GestureDetector(
                      onTap: () async {

                        // await context.read<MyPlansProvider>().subscribeNowBtn(context:context,id:id);
                      },
                      child:
                      Consumer<MyPlansProvider>(builder: (context, planP, child) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          // height: 50,
                          decoration: planP.advertisementBtnDecoration(
                              productCode:
                                  'Platinum-Elite'),

                          child: Center(
                            child: Consumer<ThemeProvider>(builder: (context, themeP, child) {
                              return Text(
                                'Upgrade to Platinum ',
                                style: themeP.isDarkMode
                                    ? AppStyles.planAdStyleD
                                    : AppStyles.planAdStyleL,
                              );
                            }),
                          ),
                        );
                      }),

                    ),



                  ],
                ),
              ),
              const AddVerticalSpace(height: 10),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                child: Consumer<MyPlansProvider>(builder: (context, planP, child) {
                     return AdvertisementProduct(
                      isVisibleSubscribeBtn: false,
                      btnDecoration: planP.advertisementBtnDecoration(
                          productCode:  'Platinum-Elite'),
                      iconDecoration: planP.getProductIconDecoration(
                          productCode: 'Platinum-Elite'),
                      backgroundImgPath: planP.getAdvertisementProductBackgroundImage(
                          isDarkMode:context.watch<ThemeProvider>().isDarkMode, productCode: 'Platinum-Elite'),
                      planIconPath: planP.getProductIcon(productCode:'Platinum-Elite'),
                      investmentAmount: 0,
                      planName:  'Elite',
                      planDescription: StringCons.platinumAdContent,
                      riskProfile:  0,
                      vpsClass:   0,
                      period: 12,
                      annualROI:  0,
                      blurRowColor: planP.getBlurRowBackgroundColorForAd(
                          productCode: 'Platinum-Elite',
                          isDarkMode: context.watch<ThemeProvider>().isDarkMode));
                }),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
