import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/welcome/welcome.dart';
import 'package:gpeers/base/utils/colorsresources.dart';
import 'package:gpeers/base/utils/custom_appbar.dart';
import 'package:gpeers/base/utils/custom_button.dart';
import 'package:gpeers/base/utils/custom_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            ColorsResources.bottongroundColorOne,
            ColorsResources.buttongroundColorTwo,
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CustomAppBar(
            title: 'Gpeers',
            isBackButtonExist: true,
            onBackPressed: null,
          ),
          body: Center(
            child: CustomeContainer(
              child: Center(
                child: CustomButtonColumn(
                    btnTxt: 'Welcome',
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Welcome()));
                    }),
              ),
            ),
          )),
    );
  }
}
