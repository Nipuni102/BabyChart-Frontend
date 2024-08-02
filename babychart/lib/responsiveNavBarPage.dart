//import 'package:flutter/material.dart';

/*import 'CustomTabBarsPage.dart';
import 'childProfile.dart';

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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
            ),
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
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/profile_picture.png'), // Replace with your image path
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ..._menuItems.map((item) => ListTile(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  title: Text(item),
                )),
          ],
        ),
      );
  /*children: _menuItems
          .map((item) => ListTile(
        onTap: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        title: Text(item),
      ))
          .toList(),
    ),
  );*/

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
   _ProfileIcon({Key? key}) : super(key: key);

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

import 'package:flutter/material.dart';
import 'childProfile.dart';
import 'CustomTabBarsPage.dart';

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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
                child: CircleAvatar(
                  child: _ProfileIcon(),
                ),
              ),
            ),
          ],
        ),
        drawer: isLargeScreen ? null : _drawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
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
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/profile_picture.png'), // Replace with your image path
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ..._menuItems.map((item) => ListTile(
                  onTap: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                  title: Text(item),
                )),
          ],
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
        onSelected: (Menu item) {
          if (item == Menu.itemOne) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          }
          // Handle other menu item actions here if needed
        },
        //onSelected: (Menu item) {},
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              PopupMenuItem<Menu>(
                value: Menu.itemOne,
                child: const Text('Account'),
              ),
              PopupMenuItem<Menu>(
                value: Menu.itemTwo,
                child: const Text('Settings'),
              ),
              PopupMenuItem<Menu>(
                value: Menu.itemThree,
                child: const Text('Sign Out'),
              ),
            ]);
  }
}
