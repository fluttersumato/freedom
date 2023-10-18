import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../res/colors.dart';
import '../../styles/app_styles.dart';
import '../../utils/img_path.dart';

class ActionBarControl extends StatefulWidget implements PreferredSizeWidget {
  const ActionBarControl({super.key});

  @override
  State<ActionBarControl> createState() => _ActionBarControlState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}

class _ActionBarControlState extends State<ActionBarControl> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return AppBar(
        // brightness: Brightness.dark,

        backgroundColor: provider.isDarkMode ? Colors.black : AppC.white,
        // backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 50,
        title: Container(
          // margin: const EdgeInsets.only(top: 0),
          // decoration: AppStyles.linearGradient,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(ImgP.freedomLogo, width: 112, height: 18),
              Expanded(
                child: Container(),
              ),
              // const AddHorizontalSpace(width: 16),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                padding: const EdgeInsets.all(5),
                decoration: AppStyles.setIconContainerStyle(
                    isDarkMode: provider.isDarkMode),
                child: Image.asset(
                  ImgP.planIcon,
                  width: 24,
                  height: 24,
                ),
              ),

              //         ColorFiltered(
              //   colorFilter: ColorFilter.mode(Colors.white, BlendMode.color), // Change blue to the desired color
              //   child: Image.asset('assets/image.png'),
              // )
              // Plan Icon

              // Theme Change Button
              GestureDetector(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  padding: const EdgeInsets.all(5),
                  // color: themeProvider.currentTheme == AppTheme.Light
                  //     ? AppColors.white
                  //     : Colors.black,

                  decoration: AppStyles.setIconContainerStyle(
                    isDarkMode: provider.isDarkMode),

                  child: Image.asset(
                    provider.isDarkMode ? ImgP.sunIcon : ImgP.moonIcon,
                    width: 24,
                    height: 24,
                  ), // Replace with your actual app logo ,
                ),
                onTap: () {
                  // TODO: Implement your theme change logic here
                  context
                      .read<ThemeProvider>()
                      .toggleTheme(); // Use the provider to toggle theme
                },
              ),
              // Profile Image Button
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  padding: const EdgeInsets.all(5),
                  decoration: AppStyles.setIconContainerStyle(
                      isDarkMode: provider.isDarkMode),

                  child: Image.asset(
                    ImgP.moonIcon,
                    width: 24,
                    height: 24,
                  ), // Replace with your actual app logo ,
                ),
                onTap: () {
                  // Show PopupMenuButton directly
                  // TODO: Implement navigation
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(
                        1000, 82, 15, 0), // Adjust the position
                    items: [
                      const PopupMenuItem(
                        child: Text('Menu Item 1'),
                      ),
                      const PopupMenuItem(
                        child: Text('Menu Item 2'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: AppStyles.setActionBarContainerStyle(isDarkMode:provider.isDarkMode),
        ),
      );
    });
  }
}
