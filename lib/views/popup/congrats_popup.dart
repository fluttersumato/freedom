import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_provider.dart';
import '../../res/colors.dart';
import '../../utils/img_path.dart';

class CongratsDistributorPopup extends StatelessWidget {

 final String title,description;
 final bool isSuccess;

  const CongratsDistributorPopup({super.key, required this.isSuccess,required this.title,required this.description});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        // padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),

        child: Stack(
          alignment: Alignment.center,
          children: [
            Consumer<ThemeProvider>(builder: (context, themeP, child) {
              return Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeP.isDarkMode? AppC.black:AppC.white,

                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.blue), // Border color
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration:  BoxDecoration(
                          color:isSuccess? Colors.green:Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(isSuccess?ImgP.congratsPopupImage:ImgP.congratsPopupImage, height: 25,),
                      ),

                      const SizedBox(height: 12),
                       Text(
                        title, // Replace with your title
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                       Text(
                        description , // Replace with your message
                        style: const TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Close',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


