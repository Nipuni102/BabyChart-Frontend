/*import 'package:flutter/material.dart';
import 'chart.dart';
import 'charts.dart';
import 'immunizationH.dart';

class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({Key? key}) : super(key: key);

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xFFCC31A1);
  final _tabs = const [
    Tab(text: 'Immunization'),
    Tab(text: 'Charts'),
    Tab(text: 'Activity'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: kToolbarHeight + 0.8,
          decoration: BoxDecoration(
            color: _selectedColor,
          ),
          child: TabBar(
            controller: _tabController,
            indicator: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              color: Colors.white,
            ),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: _tabs,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/immunization');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/charts');
                  break;
                // Add more cases for other tabs if needed
              }
            },
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              immunizationH(),
              Chart(),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'chart.dart';
import 'charts.dart';
import 'development.dart';
import 'immunizationH.dart';
import 'activity.dart';

class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({Key? key}) : super(key: key);

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  //final GlobalKey<_DevelopmentScreenState> _developmentScreenKey = GlobalKey();

  final _selectedColor = const Color(0xFFCC31A1);
  final _tabs = const [
    Tab(text: 'Immunization'),
    Tab(text: 'Charts'),
    Tab(text: 'Development'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,
        //title: const Text('BabyChart'),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            color: Colors.white,
          ),
          indicatorSize: TabBarIndicatorSize
              .tab, // Ensure indicator takes the full tab width
          indicatorWeight: 3,
          labelColor: _selectedColor,
          unselectedLabelColor: Colors.white,
          // tabs: _tabs,
          tabs: _tabs.map((Tab tab) {
            return Container(
              width: 120.0, // Set a fixed width for the tab
              alignment: Alignment.center, // Center the text
              child: tab,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ImmunizationH(),
          Chart(),
          DevelopmentScreen(),
        ],
      ),
    );
  }
}*/

import 'package:flutter/material.dart';

import 'activity.dart';
import 'charts.dart';
import 'development.dart';
import 'immunizationH.dart';

class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({super.key});

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _selectedColor = const Color(0xFF8E42D6);
  bool _isActivityScreen = false;

  final _tabs = const [
    Tab(text: 'Immunization'),
    Tab(text: 'Charts'),
    Tab(text: 'Development'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  void _navigateToActivities() {
    setState(() {
      _isActivityScreen = true;
    });
  }

  void _navigateBack() {
    setState(() {
      _isActivityScreen = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _selectedColor,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          indicator: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            color: Colors.white,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 3,
          labelColor: _selectedColor,
          unselectedLabelColor: Colors.white,
          tabs: _tabs.map((Tab tab) {
            return Container(
              width: 120.0,
              alignment: Alignment.center,
              child: tab,
            );
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          const ImmunizationH(),
          const Chart(),
          _isActivityScreen
              ? ActivitiesScreen(onBack: _navigateBack)
              : DevelopmentScreen(
                  onNavigateToActivities: _navigateToActivities),
        ],
      ),
    );
  }
}
