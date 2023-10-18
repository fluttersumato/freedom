import 'package:flutter/material.dart';


class SingleChildScrollExample extends StatefulWidget {
  const SingleChildScrollExample({super.key});

  @override
  State<SingleChildScrollExample> createState() =>
      _SingleChildScrollExampleState();
}

class _SingleChildScrollExampleState extends State<SingleChildScrollExample> {
  @override
  Widget build(BuildContext context) {
    // final bool isDarkMode=context.watch<ThemeProvider>().isDarkMode;
    return SingleChildScrollView(
      child: Column(
        children: [

          Container(
            color: Colors.red,
            height: 500,
          ),
          Container(
            color: Colors.green,
            height: 500,
          ),
          Container(
            color: Colors.black,
            height: 500,
          ),
          Container(
            color: Colors.blue,
            height: 500,
          ),
          Container(
            color: Colors.yellow,
            height: 500,
          ),
        ],
      ),
    );
  }
}
