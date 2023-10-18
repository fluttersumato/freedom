import 'package:flutter/material.dart';
import 'package:freedom/providers/internet_connection_status_provider.dart';
import 'package:freedom/providers/my_plans_provider.dart';
import 'package:freedom/providers/theme_provider.dart';
import 'package:freedom/views/investmentDashboard/my_plans.dart';
import 'package:provider/provider.dart';
import 'views/investmentDashboard/investment_dashboard.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => MyPlansProvider()),
      ],
      // child:  HomePage(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // end internet popup

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final bool isDarkMode = context.watch<ThemeProvider>().isDarkMode;
    return MaterialApp(
      color: Colors.red,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: context.watch<ThemeProvider>().themeData,
      home:
      /*   MyTestingPage(),*/
      const InvestmentDashBoard(),
      // HomePage(),
      /*  routes: {
        '/disconnected': (context) => DisconnectedPage(),
      },*/

      // const MyPlans(),
    );

    // home: const MyHomePage(title: 'Flutter Demo Home Page'),
  }
}

class BottomTabControlExample extends StatefulWidget {
  const BottomTabControlExample({super.key});

  @override
  _BottomTabControlExampleState createState() =>
      _BottomTabControlExampleState();
}

class _BottomTabControlExampleState extends State<BottomTabControlExample> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue,
        onPressed: () {},
        child: Image.asset(
          ImgP.freedomBirdIcon, // Replace with your bird icon asset path
          width: 40,
          height: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,*/
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Content for Tab $selectedIndex',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _counter = 0;

  // void _incrementCounter() async {
  //
  // }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            /* MaterialPageRoute(
                builder: (context) => MyPlans(
                  backgroundImgPath:
                      'lib/res/images/StandardBackgroundLight.png',
                  planIconPath: 'lib/res/images/StandardIcon.png',
                  tradeStatus: productsModel.data?.userStatus as int,

                  // "Live",
                  balance: '${productsModel.data?.balance}',
                  isTradeStart: false,
                  isTradePause: false,
                  isTradeStop: false,
                  planName: '${productsModel.data?.userProduct?.name}',
                ),
              ),  */
            MaterialPageRoute(
              builder: (context) => const MyPlans(),
            ),
          );

/*
          setState(() {
            // This call to setState tells the Flutter framework that something has
            // changed in this State, which causes it to rerun the build method below
            // so that the display can reflect the updated values. If we changed
            // _counter without calling setState(), then the build method would not be
            // called again, and so nothing would appear to happen.
            // dev.debugger();
             // wherever you want to stop

            _counter++;
          });
          */
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
