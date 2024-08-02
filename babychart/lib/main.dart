import 'package:babychart/childRegister.dart';
import 'package:babychart/kidsSelecting.dart';
import 'package:babychart/qrCodePage.dart';
import 'package:babychart/responsiveNavBarPage.dart';
import 'package:babychart/selectChild.dart';
import 'package:babychart/selectingPage.dart';
import 'package:babychart/signInPage.dart';
import 'package:babychart/signUpPage.dart';
import 'package:babychart/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:babychart/charts.dart';
import 'package:babychart/immunizationH.dart';
import 'package:babychart/MidHome.dart';
import 'package:babychart/enter_vaccination.dart';
import 'package:babychart/addChildFirstPage.dart';
import 'package:babychart/addChildSecPage.dart';
import 'package:babychart/addChildThirdPage.dart';
import 'package:babychart/addChildFourthPage.dart';
import 'package:babychart/activity.dart';
//import 'package:babychart/childProfile.dart';
import 'CustomTabBarsPage.dart';
import 'chart.dart';
import 'midSignIn.dart';
import 'midSignUp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFCC31A1),
        brightness: Brightness.light,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => WelcomePage(),
        '/nav': (context) => ResponsiveNavBarPage(),
        '/immunization': (context) => ImmunizationH(),
        '/charts': (context) => Chart(),
        '/selectingPage': (context) => SelectingPage(),
        '/signIn': (context) => SignInPage(),
        '/signUp': (context) => SignUpPage(),
        '/selectChild': (context) => SelectChild(),
        '/midSignIn': (context) => MidSignInPage(),
        '/midSignUp': (context) => MidSignUpPage(),
        '/kidsSelecting': (context) => KidsSelecting(),
        '/chart': (context) => Chart(),
        '/childRegister': (context) => ChildRegister(),
        '/midHome': (context) => MidHome(),
        '/enterVaccination': (context) => EnterVaccination(),
        '/addChildSecPage': (context) => AddNewChildSecScreen(),
        '/addChildThirdPage': (context) => AddNewChildThirdScreen(),
        '/addChildFirstPage': (context) => AddNewChildScreen(),
        '/addChildFourthPage': (context) => AddNewChildFourthScreen(),

        // '/activity': (context) => ActivitiesScreen(),
        '/qr': (context) => const QrCodePage(qrData: ''),

      },
    );
  }
}

/*
class ResponsiveNavBarPage extends StatelessWidget {
  ResponsiveNavBarPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: const Color(0xFFCC31A1),
          elevation: 0,
          titleSpacing: 0,
          leading: isLargeScreen
              ? null
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Baby Chart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                if (isLargeScreen) Expanded(child: _navBarItems())
              ],
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: _ProfileIcon()),
            )
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: CustomTabBarsPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawer() => Drawer(
        child: ListView(
          children: _menuItems
              .map((item) => ListTile(
                    onTap: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    title: Text(item),
                  ))
              .toList(),
        ),
      );

  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _menuItems
            .map(
              (item) => InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
            .toList(),
      );
}

final List<String> _menuItems = <String>[
  'About',
  'Contact',
  'Settings',
  'Sign Out',
];

enum Menu { itemOne, itemTwo, itemThree }

class _ProfileIcon extends StatelessWidget {
  const _ProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
        icon: const Icon(Icons.person),
        offset: const Offset(0, 40),
        onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: Text('Account'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: Text('Settings'),
              ),
              const PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: Text('Sign Out'),
              ),
            ]);
  }
}*/

/*class CustomTabBarsPage extends StatefulWidget {
  const CustomTabBarsPage({super.key});

  @override
  State<CustomTabBarsPage> createState() => _CustomTabBarsPageState();
}

class _CustomTabBarsPageState extends State<CustomTabBarsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _selectedColor = const Color(0xFFCC31A1);
  //final _unselectedColor = const Color(0xff5f6368);
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
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.transparent,
          //padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: ListView(shrinkWrap: true, children: [
            /// Custom Tabbar with solid selected bg and transparent tabbar bg
            Container(
              height: kToolbarHeight + 0.8,
              padding:
                  const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              decoration: BoxDecoration(
                color: _selectedColor,
                // borderRadius: const BorderRadius.only(
                //topLeft: Radius.circular(8.0),
                //topRight: Radius.circular(8.0)),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0)),
                    color: Colors.white),
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
                  charts(),
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}

class UnderlineTabIndicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;

  const UnderlineTabIndicator({
    required this.indicatorHeight,
    required this.indicatorColor,
  });

  @override
  createBoxPainter([VoidCallback? onChanged]) {
    return _MaterialDesignPainter(this, onChanged);
  }
}

class _MaterialDesignPainter extends BoxPainter {
  final UnderlineTabIndicator decoration;

  _MaterialDesignPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Rect rect = Offset(
          offset.dx,
          configuration.size!.height - decoration.indicatorHeight,
        ) &
        Size(configuration.size!.width, decoration.indicatorHeight);

    final Paint paint = Paint()
      ..color = decoration.indicatorColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        rect,
        topRight: const Radius.circular(8),
        topLeft: const Radius.circular(8),
      ),
      paint,
    );
  }
}*/
