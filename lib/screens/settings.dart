import 'package:flutter/material.dart';
import 'package:medmind/screens/ferquentIllnessTab.dart';
import 'package:medmind/screens/illnessTab.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final toptabbar = TabBar(
      controller: _tabController,
      tabs: const <Widget>[
        Tab(
          icon: Icon(Icons.medical_services),
        ),
        Tab(
          icon: Icon(Icons.timer),
        ),
      ],
    );
    final topappbar = AppBar(
      backgroundColor: Color(0xff1081EE),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Med Mind",
            style: TextStyle(fontSize: 34.0),
          ),
          SizedBox(
            width: mq.size.width / 20,
          ),
          Image.asset(
            'assets/logo.png',
            height: mq.size.height / 12,
          )
        ],
      ),
      bottom: toptabbar,
    );

    return Scaffold(
      appBar: topappbar,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: IllnessTab(),
          ),
          Center(
            child: FrequentIllnessTab(),
          ),
        ],
      ),
    );
  }
}
