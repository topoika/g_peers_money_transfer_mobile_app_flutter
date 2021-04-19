import 'package:flutter/material.dart';
import 'package:gpeers/base/utils/custom_appbar.dart';

class SetpinPage extends StatefulWidget {
  SetpinPage({Key key}) : super(key: key);

  @override
  _SetpinPageState createState() => _SetpinPageState();
}

class _SetpinPageState extends State<SetpinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Step 3/6',
        textColor: Colors.grey,
        onBackPressed: () {},
      ),
      body: Container(),
    );
  }
}
