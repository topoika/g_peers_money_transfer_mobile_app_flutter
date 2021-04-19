import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/auth/login.dart';
import 'package:gpeers/base/utils/custom_appbar.dart';

class VerifyId extends StatefulWidget {
  VerifyId({Key key}) : super(key: key);

  @override
  _VerifyIdState createState() => _VerifyIdState();
}

class _VerifyIdState extends State<VerifyId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Step 4/6',
        textColor: Colors.grey,
        onBackPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
      ),
      body: Container(
        child: Text('text'),
      ),
    );
  }
}
