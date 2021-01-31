import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_management/report.dart';
import 'package:waste_management/news_tab.dart';
import 'package:waste_management/profile.dart';
import 'package:waste_management/settings.dart';
import 'package:waste_management/waste_management.dart';
import 'package:waste_management/widgets.dart';
import 'package:waste_management/schedule.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayout createState() => _MainLayout();
}

class _MainLayout extends State<MainLayout> {
  // This app keeps a global key for the songs tab because it owns a bunch of
  // data. Since changing platform re-parents those tabs into different
  // scaffolds, keeping a global key to it lets this app keep that tab's data as
  // the platform toggles.
  //s
  // This isn't needed for apps that doesn't toggle platforms while running.
  final wasteManagementKey = GlobalKey();

  // In Material, this app uses the hamburger menu paradigm and flatly lists
  // all 4 possible tabs. This drawer is injected into the songs tab which is
  // actually building the scaffold around the drawer.
  Widget _buildAndroidHomePage(BuildContext context) {
    return WasteManagement(
      key: wasteManagementKey,
      androidDrawer1: _AndroidDrawer(),
    );
  }

  // On iOS, the app uses a bottom tab paradigm. Here, each tab view sits inside
  // a tab in the tab scaffold. The tab scaffold also positions the tab bar
  // in a row at the bottom.
  //
  // An important thing to note is that while a Material Drawer can display a
  // large number of items, a tab bar cannot. To illustrate one way of adjusting
  // for this, the app folds its fourth tab (the settings page) into the
  // third tab. This is a common pattern on iOS.
  Widget _buildIosHomePage(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            label: WasteManagement.title,
            icon: WasteManagement.iosIcon,
          ),
          BottomNavigationBarItem(
            label: NewsTab.title,
            icon: NewsTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ProfileTab.title,
            icon: ProfileTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ScheduleTab.title,
            icon: ScheduleTab.iosIcon,
          ),
          BottomNavigationBarItem(
            label: ReportTab.title,
            icon: ReportTab.iosIcon,
          ),


        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              defaultTitle: WasteManagement.title,
              builder: (context) => WasteManagement(key: wasteManagementKey),
            );
          case 1:
            return CupertinoTabView(
              defaultTitle: NewsTab.title,
              builder: (context) => NewsTab(),
            );
          case 2:
            return CupertinoTabView(
              defaultTitle: ProfileTab.title,
              builder: (context) => ProfileTab(),
            );
          case 3:
            return CupertinoTabView(
              defaultTitle: ScheduleTab.title,
              builder: (context) => ScheduleTab(),
            );
          case 4:
            return CupertinoTabView(
              defaultTitle: ReportTab.title,
              builder: (context) => ReportTab(),
            );

          default:
            assert(false, 'Unexpected tab');
            return null;
        }
      },
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroidHomePage,
      iosBuilder: _buildIosHomePage,
    );
  }
}


class _AndroidDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Icon(
                Icons.account_circle,
                color: Colors.green.shade800,
                size: 96,
              ),
            ),
          ),
          ListTile(
            leading: WasteManagement.androidIcon,
            title: Text(WasteManagement.title),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: NewsTab.androidIcon,
            title: Text(NewsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context, MaterialPageRoute(builder: (context) => NewsTab()));
            },
          ),
          ListTile(
            leading: ProfileTab.androidIcon,
            title: Text(ProfileTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => ProfileTab()));
            },
          ),
          ListTile(
            leading: ScheduleTab.androidIcon,
            title: Text(ScheduleTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(
                  context, MaterialPageRoute(builder: (context) => ScheduleTab()));
            },
          ),
          ListTile(
            leading: ReportTab.androidIcon,
            title: Text(ReportTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => ReportTab()));
            },
          ),

          // Long drawer contents are often segmented.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: SettingsTab.androidIcon,
            title: Text(SettingsTab.title),
            onTap: () {
              Navigator.pop(context);
              Navigator.push<void>(context,
                  MaterialPageRoute(builder: (context) => SettingsTab()));
            },
          ),
        ],
      ),
    );
  }
}