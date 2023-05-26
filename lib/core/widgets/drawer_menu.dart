import 'package:flutter/material.dart';
import 'package:weathery/core/widgets/main_wrapper.dart';
import 'package:weathery/features/help_screen/presentation/screens/help_screen.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[100],
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Text(''
                'Weathry app'),
          ),

          // ListTile(
          //   title: const Text('Home page'),
          //   onTap: () {
          //     Navigator.of(context).pushNamed(MainWrapper.routeName);
          //   },
          // ),
          ListTile(
            title: const Text('Guide'),
            onTap: () {
              Navigator.of(context).pushNamed(HelpScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
