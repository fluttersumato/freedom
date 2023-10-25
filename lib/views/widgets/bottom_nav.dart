import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../res/colors.dart';
import '../../utils/img_path.dart';

class BottomTabControl extends StatefulWidget {


  final ValueChanged<int> onTabSelected;
  final int selectedIndex;

  final String tab0Title, tab1Title, tab2Title, tab3Title;
  final  String tab0IconPath, tab1IconPath, tab2IconPath, tab3IconPath;

  const BottomTabControl(
      {super.key, required this.onTabSelected,
        required this.selectedIndex,
        required this.tab0Title,
        required this.tab1Title,
        required this.tab2Title,
        required this.tab3Title,
        required this.tab0IconPath,
        required this.tab1IconPath,
        required this.tab2IconPath,
        required this.tab3IconPath});

  @override
  State<BottomTabControl> createState() => _BottomTabControlState();
}

class _BottomTabControlState extends State<BottomTabControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeP, child) {
      return Container(
        color: themeP.isDarkMode ? Colors.black : Colors.white,
        height: 70,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF092F48), // Light
                        Color(0xFF102C3F), // Dark
                      ],
                      stops: [0.1, 1.0],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(36.0),
                      topRight: Radius.circular(36.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: _buildTabItem(
                          icon: Image.asset(
                            widget.tab0IconPath,
                            width: 20,
                          ),
                          title: Text(widget.tab0Title,
                              style:
                              const TextStyle(fontSize: 10, color: Colors.white)),
                          selectedIndex: 0,
                          selected: widget.selectedIndex == 0,
                        ),
                      ),
                      Expanded(
                        child: _buildTabItem(
                          icon: Image.asset(
                            widget.tab1IconPath,
                            width: 22,
                          ),
                          title: Text(widget.tab1Title,
                              style:
                              const TextStyle(fontSize: 10, color: Colors.white)),
                          selectedIndex: 1,
                          selected: widget.selectedIndex == 1,
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Expanded(
                        child: _buildTabItem(
                          icon: Image.asset(
                            widget.tab2IconPath,
                            width: 22,
                          ),
                          title: Text(widget.tab2Title,
                              style:
                              const TextStyle(fontSize: 10, color: Colors.white)),
                          selectedIndex: 3,
                          selected: widget.selectedIndex == 3,
                        ),
                      ),
                      Expanded(
                        child: _buildTabItem(
                          icon: Image.asset(
                            widget.tab3IconPath,
                            width: 22,
                          ),
                          title: Text(widget.tab3Title,
                              style:
                              const TextStyle(fontSize: 10, color: Colors.white)),
                          selectedIndex: 4,
                          selected: widget.selectedIndex == 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  backgroundColor: widget.selectedIndex == 2
                      ? const Color(0xFF0D324B)
                      : const Color(0xFF0D324B),
                  // widget.selectedIndex == 2 ? Color(0xFF90FFFFFF) : Color(0xFF0D324B),

                  onPressed: () {
                    if (widget.selectedIndex != 2) {
                      widget.onTabSelected(2);
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  child: Image.asset(
                    ImgP.freedomBirdIcon, // Replace with your bird icon asset path
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildTabItem(
      {Image? icon, Text? title, int? selectedIndex, bool selected = false}) {
    final tabColor = selected ? AppC.selectedTab : AppC.unSelectedTab;
    return GestureDetector(
      onTap: () {
        widget.onTabSelected(selectedIndex!);
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.only(top: 3),
        // color: tabColor,
        decoration: selectedIndex == 4
            ? BoxDecoration(
          color: tabColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(36.0),
          ),
        )
            : selectedIndex == 0
            ? BoxDecoration(
          color: tabColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36.0),
          ),
        )
            : BoxDecoration(
          color: tabColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon!,
            const SizedBox(
              height: 3,
            ),
            title!,
            const SizedBox(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }
}




