import 'package:flutter/material.dart';
import 'package:freedom/models/tradeHistory/trade_history_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/my_plans_provider.dart';
import '../../../res/colors.dart';
import '../../../styles/app_styles.dart';
import '../../../utils/img_path.dart';
import 'add_column_for_trade_history.dart';
import 'package:intl/intl.dart';

class HistoryTabContent extends StatefulWidget {
  const HistoryTabContent({super.key});

  @override
  State<HistoryTabContent> createState() => _HistoryTabContentState();
}

class _HistoryTabContentState extends State<HistoryTabContent> {
  // late TradeHistoryModel tradeModel ;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Provider.of(context,listen:false).yourFunctionWithNotifyListener();
      Provider.of<MyPlansProvider>(context, listen: false)
          .getTradeHistory(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double verticalSpace = 6;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Center(
            child: Text(
              'Trade History',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'PoppinsLight',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: Provider.of<MyPlansProvider>(context, listen: true)
                    .tradeHistoryResponse
                    ?.table
                    ?.length,
                itemBuilder: (BuildContext context, int index) {
                  return Consumer<MyPlansProvider>(
                      builder: (context, provider, child) {
                    return Card(
                        color: AppC.white,
                        shape: AppStyles.borderShapeForCards,
                        elevation: 1,
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 2.0),
                              child: Card(
                                color: AppC.frameColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Direction',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.53,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      Text(
                                        provider.tradeHistoryResponse
                                                ?.table?[index].direction ??
                                            "empty",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.53,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        decoration: ShapeDecoration(
                                          color: AppC.frameGreenColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                        ),
                                        child: Image.asset(
                                          ImgP.buyDirection,
                                          width: 10,
                                          height: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AddRowForTradeHistory(
                                        title: 'Order ID',
                                        value: provider.tradeHistoryResponse
                                                ?.table?[index].orderId
                                                .toString() ??
                                            "1",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Open Time',
                                        value: DateFormat('HH:mm:ss').format(
                                            provider
                                                .tradeHistoryResponse
                                                ?.table?[index]
                                                .openTime as DateTime),
                                        // value: provider.tradeHistoryResponse?.table?[index].openTime.toString() ?? "1",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Volume',
                                        value:
                                            '${provider.tradeHistoryResponse?.table?[index].closedVolume}%',
                                        verticalSpace: verticalSpace),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AddRowForTradeHistory(
                                        title: 'Market',
                                        value: provider.tradeHistoryResponse
                                                ?.table?[index].market ??
                                            "",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Close Time',
                                        value: DateFormat('HH:mm:ss').format(
                                            provider
                                                .tradeHistoryResponse
                                                ?.table?[index]
                                                .closeTime as DateTime),
                                        // value: provider.tradeHistoryResponse?.table?[index].closeTime.toString() ?? "",

                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Broker Commission',
                                        value:
                                            "${provider.tradeHistoryResponse?.table?[index].commission}%",
                                        verticalSpace: verticalSpace),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AddRowForTradeHistory(
                                        title: 'Symbol',
                                        value: provider.tradeHistoryResponse
                                                ?.table?[index].symbol ??
                                            "",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Entry Price',
                                        value:
                                            '\$${provider.tradeHistoryResponse?.table?[index].entryPrice}'
                                                    .toString() ??
                                                "",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Net',
                                        value:
                                            '\$${provider.tradeHistoryResponse?.table?[index].net}'
                                                    .toString() ??
                                                "",
                                        verticalSpace: verticalSpace),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    AddRowForTradeHistory(
                                        title: 'Closing Price',
                                        value:
                                            '\$${provider.tradeHistoryResponse?.table?[index].closingPrice}'
                                                    .toString() ??
                                                "",
                                        verticalSpace: verticalSpace),
                                    AddRowForTradeHistory(
                                        title: 'Balance',
                                        value:
                                            '\$${provider.tradeHistoryResponse?.table?[index].balance}'
                                                    .toString() ??
                                                "",
                                        verticalSpace: verticalSpace),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ));
                    return Text(
                      provider.tradeHistoryResponse?.table?[index].orderId
                              .toString() ??
                          "empty", // accessing Provider class variable
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
