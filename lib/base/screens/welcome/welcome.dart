import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/auth/login.dart';
import 'package:gpeers/base/utils/colorsresources.dart';
import 'package:gpeers/base/utils/custom_button.dart';
import 'package:gpeers/base/utils/custom_container.dart';
import 'package:gpeers/base/utils/imagesresources.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: 400,
            color: ColorsResources.backgroundColorsOne,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(800),
                  topRight: Radius.circular(800),
                ),
              ),
              height: 130,
              width: 400,
            ),
          ),
          Container(
            child: Center(
              child: CustomeContainer(
                backColor: Colors.white,
                child: Column(
                  children: <Widget>[
                    Image.asset(Images.welcome1),
                    SizedBox(height: 30),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFont.primaryFont,
                        fontSize: 14,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Spacer(),
                    CustomButtonColumn(
                      btnTxt: 'Create Accaunt',
                      onTap: null,
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Login to Accaunt',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              color: Colors.purple[600],
                              fontSize: 18,
                              fontFamily: AppFont.primaryFont,
                            ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
