import 'package:flutter/material.dart';

import 'menuNavbar.dart';

class MenuNavBarView extends StatefulWidget {
  const MenuNavBarView({ Key key, this.menuNavBar
  }) : super(key: key);

  final MenuNavbar menuNavBar;

  @override
  _MenuNavBarViewState createState() => _MenuNavBarViewState();
}

class _MenuNavBarViewState extends State<MenuNavBarView> {
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
//    _textController = TextEditingController(
//      text: 'sample text: ${widget.menuNavBar.title}',
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.menuNavBar.title} Text'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.center,
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}