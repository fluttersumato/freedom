import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';
import '../../enums/trade_status.dart';
import '../../providers/my_plans_provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/colors.dart';
import '../../styles/app_styles.dart';
import '../widgets/blur_row.dart';

class MyPlans extends StatefulWidget {
  const MyPlans({super.key});

  @override
  State<MyPlans> createState() => _MyPlansState();
}

class _MyPlansState extends State<MyPlans> {
  @override
/*  void initState() {
    super.initState();
    fetchData();
  }*/
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of(context,listen:false).yourFunctionWithNotifyListener();
      Provider.of<MyPlansProvider>(context, listen: false).getPlansData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // MediaQueryData mediaQuery = MediaQuery.of(context);
    final myPlanP = Provider.of<MyPlansProvider>(context, listen: true);

    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, themeP, child) {
          return Scaffold(
            backgroundColor: themeP.isDarkMode ? Colors.black : AppC.white,
            // appBar:AppBar(title: Text('hi'),),

            body: SingleChildScrollView(
              child: Stack(
                children: [
                  if (myPlanP.apiResult.data?.userProduct == null)
                    const Text('No data available'),
                  if (myPlanP.apiResult.data?.userProduct != null)
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Consumer<ThemeProvider>(
                                  builder: (context, themeP, child) {
                                return Card(
                                  elevation: 3.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: const BorderSide(
                                      color: Colors
                                          .grey, // Set the border color here
                                      width: 1.5, // Set the border width here
                                    ), // Adjust the radius as needed
                                  ),
                                  color: themeP.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 7),
                                    child: Consumer<MyPlansProvider>(
                                        builder: (context, planP, child) {
                                      return Image.asset(
                                        planP.getProductBackgroundImage(
                                            productCode: planP.apiResult.data
                                                ?.userProduct?.productCode,
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
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 23, 20, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Consumer<MyPlansProvider>(
                                            builder: (context, planP, child) {
                                          return Container(
                                            padding: const EdgeInsets.all(0),
                                            /*   decoration: myPlanP.getProductIconBackgroundStyle(productCode:"Standard-Basic"),  */
                                            decoration:
                                                planP.getProductIconDecoration(
                                                    productCode: planP
                                                            .apiResult
                                                            .data
                                                            ?.userProduct
                                                            ?.productCode ??
                                                        ''),
                                            child: Image.asset(
                                              planP.getProductIcon(
                                                productCode: planP
                                                    .apiResult
                                                    .data
                                                    ?.userProduct
                                                    ?.productCode,
                                              ),
                                              width: 35,
                                              height: 35,
                                            ),
                                          );
                                        }),
                                        const AddHorizontalSpace(width: 10),
                                        Consumer<MyPlansProvider>(
                                            builder: (context, planP, child) {
                                          return Text(
                                            // widget.planName,
                                            planP.apiResult.data?.userProduct
                                                ?.name ?? '',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                            // const TextStyle(
                                            //     color: Colors.white, fontSize: 24),
                                          );
                                        }),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Trade Status",
                                              style: TextStyle(
                                                  color: themeP.isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 12),
                                            ),
                                            const AddVerticalSpace(height: 5),
                                            Consumer<MyPlansProvider>(builder:
                                                (context, planP, child) {
                                              return Container(
                                                /*width: 62,
                                                            height: 26,*/
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: planP
                                                    .getDecorationForTradeStatus(
                                                        planP.apiResult.data
                                                                ?.userStatus
                                                            as int),
                                                child: Center(
                                                  child: Text(
                                                    TradeStatus
                                                        .values[planP
                                                            .apiResult
                                                            .data
                                                            ?.userStatus as int]
                                                        .name,
                                                    style: const TextStyle(
                                                      color: AppC.white,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                            /*Container(
                              width: 62,
                              height: 26,
                              padding: const EdgeInsets.all(0),
                              decoration:
                                  planP.getDecorationForTradeStatus(
                                      widget.tradeStatus),
                              child: Center(
                                child: Text(
                                  TradeStatus
                                      .values[widget.tradeStatus].name,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),*/
                                          ],
                                        ),
                                      ],
                                    ),
                                    const AddVerticalSpace(height: 10),
                                    Stack(
                                      children: [
                                        const BlurredRowWidget(
                                          height: 76,
                                          cornerRadius: 10,
                                        ),
                                        Positioned(
                                          left: 10,
                                          top: 10,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Trading Account balance",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,

                                                /*   TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),*/
                                              ),
                                              const AddVerticalSpace(
                                                  height: 10),
                                              Consumer<MyPlansProvider>(builder:
                                                  (context, planP, child) {
                                                return Text(
                                                  // '\$${widget.balance}',
                                                  '\$${planP.formatDouble(planP.apiResult.data?.balance as double)}',
                                                  // '\$${planP.apiResult.data?.balance}',
                                                  style: TextStyle(
                                                    color: themeP.isDarkMode
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              }),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const AddVerticalSpace(height: 10),
                                    GestureDetector(
                                      child: Consumer<MyPlansProvider>(
                                          builder: (context, planP, child) {
                                        return Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: (planP.apiResult.data
                                                      ?.userStatus as int) ==
                                                  TradeStatus.active.index
                                              ? AppStyles
                                                  .btnStartedContainerStyle
                                              : AppStyles
                                                  .btnStartContainerStyle,
                                          child: Center(
                                            child: Consumer<MyPlansProvider>(
                                                builder:
                                                    (context, planP, child) {
                                              return Text(
                                                (planP.apiResult.data
                                                                ?.userStatus
                                                            as int) ==
                                                        TradeStatus.active.index
                                                    ? "Trades Started"
                                                    : "Start Trades",
                                                style: TextStyle(
                                                  color: themeP.isDarkMode
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontSize: 16,
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      }),
                                      onTap: () async {
                                        await myPlanP.startTrade(context);
                                      },
                                    ),
                                    const AddVerticalSpace(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            child: Consumer<MyPlansProvider>(
                                                builder:
                                                    (context, planP, child) {
                                              return Container(
                                                // width: mediaQuery.size.width * 0.43,
                                                padding:
                                                    const EdgeInsets.all(10),

                                                // decoration: AppStyles.btnPauseContainerStyle,
                                                decoration: (planP
                                                                .apiResult
                                                                .data
                                                                ?.userStatus
                                                            as int) ==
                                                        TradeStatus.paused.index
                                                    ? AppStyles
                                                        .btnPausedContainerStyle
                                                    : AppStyles
                                                        .btnPauseContainerStyle,
                                                child: Center(
                                                  child: Text(
                                                    (planP.apiResult.data
                                                                    ?.userStatus
                                                                as int) ==
                                                            TradeStatus
                                                                .paused.index
                                                        ? "Trades Paused"
                                                        : "Pause Trades",
                                                    style: TextStyle(
                                                      color: themeP.isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                            onTap: () async {
                                              await myPlanP.pauseTrade(context);
                                            },
                                          ),
                                        ),
                                        const AddHorizontalSpace(width: 10),
                                        Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            child: Consumer<MyPlansProvider>(
                                                builder:
                                                    (context, planP, child) {
                                              return Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: (planP
                                                                .apiResult
                                                                .data
                                                                ?.userStatus
                                                            as int) ==
                                                        TradeStatus
                                                            .stopped.index
                                                    ? AppStyles
                                                        .btnStoppedContainerStyle
                                                    : AppStyles
                                                        .btnStopContainerStyle,
                                                child: Center(
                                                  child: Text(
                                                    (planP.apiResult.data
                                                                    ?.userStatus
                                                                as int) ==
                                                            TradeStatus
                                                                .stopped.index
                                                        ? "Trades Stopped"
                                                        : "Stop Trades",
                                                    style: TextStyle(
                                                      color: themeP.isDarkMode
                                                          ? Colors.white
                                                          : Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                            onTap: () async {
                                              await myPlanP.stopTrade(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const AddVerticalSpace(height: 10),
                          myPlanP.getAdvertisement(
                              isDarkMode: themeP.isDarkMode),



                        ],
                      ),
                    ),
                 /* if (myPlanP.isLoading)
                    Center(
                      child: const CircularProgressIndicator(),
                    )*/
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
