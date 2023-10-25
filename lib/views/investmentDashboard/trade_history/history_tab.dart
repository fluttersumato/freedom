import 'package:flutter/material.dart';
import 'package:freedom/views/widgets/add_space.dart';
import 'package:provider/provider.dart';

import '../../../models/tradeHistory/trade_history_model.dart';
import '../../../providers/my_plans_provider.dart';
import '../../../providers/trade_history_provider.dart';
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
      Provider.of<TradeHistoryProvider>(context, listen: false)
          .getTradeHistory(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double verticalSpace = 6;
    /*  const List<String> dropdownList = <String>[
      'None',
      'Chocolate',
      'Vanilla',
      'ButterCream'
    ];*/
    String? dropdownInitialValue;
    return Container(
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
          Container(
            // padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            child: Consumer<TradeHistoryProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Search...",
                      ),
                      controller: TextEditingController(),
                      onChanged: (text) {
                        // Update the provider's state with the current search query.
                        // Provider.of<TradeHistoryProvider>(context, listen: false).searchText = text;
                      },
                    ),
                    const AddVerticalSpace(height: 10),
                    SizedBox(
                      // margin: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 0.0),
                      height: 57,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          labelText: "Direction",
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: provider.selectedDirectionItem,
                            items: provider.tradeDList
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                provider.setSelectedItem(item),
                          ),
                        ),
                      ),
                    ),
                    const AddVerticalSpace(height: 10),
                    SizedBox(
                      // margin: const EdgeInsets.symmetric(horizontal: 7.0,vertical: 0.0),
                      height: 57,
                      child: InputDecorator(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          labelText: "Select Trade History",
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: provider.selectedTradeHItem,
                            items: provider.tradeHDropdownList
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(item),
                                    ))
                                .toList(),
                            onChanged: (item) =>
                                provider.setSelectedTradeHItem(item),
                          ),
                        ),
                      ),
                    ),
                    const AddVerticalSpace(height: 10),

                    if (provider.isVisibleStartDate)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Start Date",
                              ),
                              controller: Provider.of<TradeHistoryProvider>(
                                      context,
                                      listen: true)
                                  .startDate,
                              onTap: () {
                                Provider.of<TradeHistoryProvider>(context,
                                        listen: false)
                                    .selectDate(context);
                              },
                            ),
                          ),
                          AddHorizontalSpace(width: 10),
                          GestureDetector(child: Image.asset(ImgP.calenderIcon,width: 20,),onTap: () {
                            Provider.of<TradeHistoryProvider>(context,
                                listen: false)
                                .selectDate(context);
                          },),
                        ],
                      ),
                    if (provider.isVisibleStartDate)
                      const AddVerticalSpace(height: 10),
                    if (provider.isVisibleStartDate)
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              readOnly: true,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "End Date",
                              ),
                              controller: Provider.of<TradeHistoryProvider>(
                                      context,
                                      listen: true)
                                  .endDate,
                              onTap: () {
                                Provider.of<TradeHistoryProvider>(context,
                                        listen: false)
                                    .selectEndDate(context);
                              },
                            ),
                          ),
                          AddHorizontalSpace(width: 10),
                          GestureDetector(child: Image.asset(ImgP.calenderIcon,width: 20,),onTap: () {
                            Provider.of<TradeHistoryProvider>(context,
                                listen: false)
                                .selectEndDate(context);
                          },),

                        ],
                      ),
                  ],
                );
              },
            ),
          ),
          if (Provider.of<TradeHistoryProvider>(context, listen: true)
                  .tradeHistoryList !=
              null)
            Expanded(
              child: Consumer<TradeHistoryProvider>(
                  builder: (context, tradeHistoryP, child) {
                return ListView.builder(
                    itemCount: tradeHistoryP.tradeHistoryList?.length,
                    itemBuilder: (BuildContext context, int index) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          tradeHistoryP.tradeHistoryList?[index]
                                                  .direction ??
                                              "empty",
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.53,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AddRowForTradeHistory(
                                          title: 'Order ID',
                                          value: tradeHistoryP
                                                  .tradeHistoryList?[index]
                                                  .orderId
                                                  .toString() ??
                                              "1",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Open Time',
                                          value: DateFormat('HH:mm:ss').format(
                                              tradeHistoryP
                                                  .tradeHistoryList?[index]
                                                  .openTime as DateTime),
                                          // value: provider.tradeHistoryResponse?.table?[index].openTime.toString() ?? "1",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Volume',
                                          value:
                                              '${tradeHistoryP.tradeHistoryList?[index].closedVolume}%',
                                          verticalSpace: verticalSpace),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AddRowForTradeHistory(
                                          title: 'Market',
                                          value: tradeHistoryP
                                                  .tradeHistoryList?[index]
                                                  .market ??
                                              "",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Close Time',
                                          value: DateFormat('HH:mm:ss').format(
                                              tradeHistoryP
                                                  .tradeHistoryList?[index]
                                                  .closeTime as DateTime),
                                          // value: provider.tradeHistoryResponse?.table?[index].closeTime.toString() ?? "",

                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Broker Commission',
                                          value:
                                              "${tradeHistoryP.tradeHistoryList?[index].commission}%",
                                          verticalSpace: verticalSpace),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AddRowForTradeHistory(
                                          title: 'Symbol',
                                          value: tradeHistoryP
                                                  .tradeHistoryList?[index]
                                                  .symbol ??
                                              "",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Entry Price',
                                          value:
                                              '\$${tradeHistoryP.tradeHistoryList?[index].entryPrice}'
                                                      .toString() ??
                                                  "",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Net',
                                          value:
                                              '\$${tradeHistoryP.tradeHistoryList?[index].net}'
                                                      .toString() ??
                                                  "",
                                          verticalSpace: verticalSpace),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AddRowForTradeHistory(
                                          title: 'Closing Price',
                                          value:
                                              '\$${tradeHistoryP.tradeHistoryList?[index].closingPrice}'
                                                      .toString() ??
                                                  "",
                                          verticalSpace: verticalSpace),
                                      AddRowForTradeHistory(
                                          title: 'Balance',
                                          value:
                                              '\$${tradeHistoryP.tradeHistoryList?[index].balance}'
                                                      .toString() ??
                                                  "",
                                          verticalSpace: verticalSpace),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ));
                    });
              }),
            ),
        ],
      ),
    );
  }
}
