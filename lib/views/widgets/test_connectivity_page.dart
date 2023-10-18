import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/internet_connection_status_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    context.read<ConnectivityProvider>().listenInternetConnectivity(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Internet Connectivity Example'),
      ),
      body: Center(child: Text('title')),
    );
  }
}
