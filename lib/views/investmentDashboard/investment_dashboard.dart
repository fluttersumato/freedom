import 'package:flutter/material.dart';
import 'package:freedom/providers/my_plans_provider.dart';
import 'package:freedom/views/investmentDashboard/tabs_content.dart';
import 'package:freedom/views/investmentDashboard/all_plans.dart';
import 'package:provider/provider.dart';
import '../../providers/internet_connection_status_provider.dart';
import '../../utils/img_path.dart';
import '../widgets/action_bar.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/loading_indicator_widget.dart';
import 'my_plans.dart';

class InvestmentDashBoard extends StatefulWidget {
  const InvestmentDashBoard({super.key});

  @override
  State<InvestmentDashBoard> createState() => _InvestmentDashBoardState();
}

class _InvestmentDashBoardState extends State<InvestmentDashBoard> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    context.read<ConnectivityProvider>().listenInternetConnectivity(context);

  }
  @override
  Widget build(BuildContext context) {
    final myPlanP = Provider.of<MyPlansProvider>(context, listen: true);
    debugPrint("==============state changed======================");
    return Scaffold(
      appBar: const ActionBarControl(),
      body: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /*Consumer<MyPlansProvider>(
                builder: (context, planP, child) {

                    return    Expanded(
                    child: planP.selectedTabIndex==0? const Center(
                      child: Text(
                        'Content for Tab 0',
                        style: TextStyle(fontSize: 20),
                      ),
                    ):const Center(
                      child: Text(
                        'Content for Tab 1',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  );

                }),*/
              // Display the content based on the selected tab index
              Expanded(
                child: Consumer<MyPlansProvider>(builder: (context, planP, child) {
                  return IndexedStack(
                    index: planP.selectedTabIndex,
                    children: [
                      const MyPlans(),
                      // const AllPlans(),
                      AllPlans(),
                      TabTwoContent(),
                      TabThreeContent(),
                      TabFourContent(),
                      // TabFiveContent(),
                    ],
                  );
                }),
              ),
              Consumer<MyPlansProvider>(builder: (context, planP, child) {
                return BottomTabControl(
                  onTabSelected: (index) {
                    // context.read<MyPlansProvider>().setTab(index);
                    planP.setTab(index);
                    // selectedIndex = planP.selectedTabIndex;

                  },
                  selectedIndex: planP.selectedTabIndex, tab0Title: 'My Plans',
                  tab1Title: 'All Plans',
                  tab2Title: 'Live Trades',
                  tab3Title: 'History',
                  tab0IconPath:ImgP.myPlanTabIcon,
                  tab1IconPath:ImgP.allPlanTabIcon,
                  tab2IconPath:ImgP.liveTradesPlanTabIconLight,
                  tab3IconPath: ImgP.historyTabIconLight,
                );
              }),


            ],
          ),
          LoadingIndicatorWidget(isLoading:myPlanP.isLoading),



        ],

      ),
    );
  }
}
