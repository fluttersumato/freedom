import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../utils/img_path.dart';

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
    return Column(
      children: [
        Center(
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
          color: AppC.frameColor,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
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
                  margin: EdgeInsets.only(left: 5),
                  padding: EdgeInsets.all(4),
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
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, // Number of columns
                  ),
                  itemCount: 4 * 6, // 4 columns and 6 rows
                  itemBuilder: (context, index) {
                    // You can replace this with your own data or widgets
                    return GridTile(
                      child: Container(
                        color: Colors.blue,
                        margin: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
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
