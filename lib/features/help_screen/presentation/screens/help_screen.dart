import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weathery/core/widgets/drawer_menu.dart';

class HelpScreen extends StatefulWidget {
  static const routeName = '/helpScreen';

  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Guide"),
        centerTitle: true,
      ),
      drawer: DrawerMenu(),
    );
  }
}
