import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';

import '../../providers/my_plans_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/constants.dart';

class GoldAd extends StatelessWidget {
  const GoldAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Consumer<ThemeProvider>(builder: (context, themeP, child) {
          return Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(
                color: Colors.grey, // Set the border color here
                width: 1.5, // Set the border width here
              ), // Adjust the radius as needed
            ),
            color: themeP.isDarkMode ? Colors.black : Colors.white,
            child: Container(
              height: 680,
              // margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child:
                  Consumer<MyPlansProvider>(builder: (context, planP, child) {
                return Image.asset(
                  planP.getProductBackgroundImage(
                      productCode:
                          planP.apiResult.data?.userProduct?.productCode,
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
                          StringCons.goldAdTitle,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Container()),
                        Consumer<MyPlansProvider>(builder: (context, planP, child) {
                          return Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(0),
                                decoration: planP.getProductIconDecoration(
                                    productCode: 'Gold-Supreme'),
                                child: Image.asset(
                                  planP.getProductIcon(
                                    productCode: 'Gold-Supreme',
                                  ),
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              const AddHorizontalSpace(width: 8),
                              Container(
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
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                    AddVerticalSpace(height: 20),
                    Text(
                      StringCons.goldAdDescription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(5, 2, 5, 0),
                child: Consumer<MyPlansProvider>(builder: (context, planP, child) {
                  return planP.getAdvertisement(
                      isDarkMode: context.watch<ThemeProvider>().isDarkMode);
                }),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
