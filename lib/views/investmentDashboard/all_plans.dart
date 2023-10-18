import 'package:flutter/material.dart';
import 'package:freedom/views/investmentDashboard/platinium_ad.dart';
import 'package:provider/provider.dart';

import '../../providers/my_plans_provider.dart';
import '../../providers/theme_provider.dart';
import 'my_plan_ad.dart';

class AllPlans extends StatelessWidget {
  const AllPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // The list
        Consumer<MyPlansProvider>(builder: (context, planP, child) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Consumer<ThemeProvider>(
                builder: (context, themeP, child) {
                  return
                    MyPlanAd(
                        id: planP.allPlansProductList?[index].id ?? 0,
                        isSubscribed: planP.allPlansProductList?[index].productCode ==
                            planP.apiResult.data?.userProduct?.productCode
                            ? true
                            : false,
                        isVisibleSubscribeBtn: true,
                        btnDecoration: planP.advertisementBtnDecoration(
                            productCode: planP.allPlansProductList?[index].productCode ??
                                ''),
                        iconDecoration: planP.getProductIconDecoration(
                            productCode:
                            planP.allPlansProductList?[index].productCode ??
                                ''),
                        // backgroundImgPath: themeP.isDarkMode ? ImgP.standardD : ImgP.standardL,
                        backgroundImgPath: planP.getProductBackgroundImage(
                            isDarkMode: themeP.isDarkMode,
                            productCode:
                            planP.allPlansProductList?[index].productCode),
                        planIconPath: planP.getProductIcon(
                            productCode:
                            planP.allPlansProductList?[index].productCode),
                        investmentAmount:
                        planP.allPlansProductList?[index].minimumDeposit ?? 0,
                        planName: planP.allPlansProductList?[index].name ?? '',
                        riskProfile: planP.allPlansProductList?[index].riskProfile ?? 0,
                        vpsClass: planP.allPlansProductList?[index].vpsclass ?? 0,
                        period: 12,
                        annualROI: planP.allPlansProductList?[index].annualExpectedRoi ?? 0,
                        blurRowColor: planP.getBlurRowBackgroundColorForAd(productCode: planP.allPlansProductList?[index].productCode ?? '', isDarkMode: themeP.isDarkMode));
                });
             /*   return ListTile(
                  title: Text('Item $index'),
                );*/
              },
              childCount: planP.allPlansProductList?.length ?? 0,
            ),
          );
        }),

        // The first container
        // if(context.watch<MyPlansProvider>().allPlansProductList?.length!=null)
        const SliverToBoxAdapter(
          child: PlatinumAd(),

        ),

        // The second container
      /*  SliverToBoxAdapter(
          child: Container(
            color: Colors.blue,
            height: 200,
          ),
        ),*/
      ],
    );
  }
}
