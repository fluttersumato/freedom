import 'package:flutter/material.dart';
import 'package:freedom/styles/app_styles.dart';
import 'package:freedom/views/widgets/add_space.dart';

import '../../res/colors.dart';
import '../../utils/img_path.dart';
import 'trade_history/add_column_for_trade_history.dart';

class TabOneContent extends StatelessWidget {
  const TabOneContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Content for Tab One"),
    );
  }
}

class TabTwoContent extends StatelessWidget {
  const TabTwoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Content for Tab Two"),
    );
  }
}

class TabThreeContent extends StatelessWidget {
  const TabThreeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Content for Tab Three"),
    );
  }
}

class TabFourContent extends StatelessWidget {
  const TabFourContent({super.key});

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
          Card(
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
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                            const Text(
                              'Buy',
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
                                    borderRadius: BorderRadius.circular(4)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AddRowForTradeHistory(
                              title: 'Order ID',
                              value: 'S122586',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Open Time',
                              value: '11:22:33',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Volume',
                              value: '55%',
                              verticalSpace: verticalSpace),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AddRowForTradeHistory(
                              title: 'Market',
                              value: 'Forex',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Close Time',
                              value: '11:22:33',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Broker Commission',
                              value: '10%',
                              verticalSpace: verticalSpace),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AddRowForTradeHistory(
                              title: 'Symbol',
                              value: 'USDT',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Entry Price',
                              value: '\$165.5',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Net',
                              value: '\$200',
                              verticalSpace: verticalSpace),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AddRowForTradeHistory(
                              title: 'Closing Price',
                              value: '\$180.55',
                              verticalSpace: verticalSpace),
                          AddRowForTradeHistory(
                              title: 'Balance',
                              value: '\$300',
                              verticalSpace: verticalSpace),
                        ],
                      ),
                    ],
                  ),
                ],
              )),

          /*Container(
            width: double.maxFinite,
            height: 500,
            child: GridView.builder(

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Number of columns
              ),
              itemCount: 4 * 6, // 4 columns and 6 rows
              itemBuilder: (context, index) {
                // You can replace this with your own data or widgets
                return GridTile(
                  child: Container(

                    color: Colors.blue,
                    margin: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Order ID',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        Text(
                          'S122586',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],

                    ),
                  ),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}

class TabFiveContent extends StatelessWidget {
  const TabFiveContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Content for Tab Five"),
    );
  }
}
