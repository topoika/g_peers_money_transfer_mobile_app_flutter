import 'package:flutter/material.dart';
import 'package:gpeers/base/utils/Constant.dart';
import 'package:gpeers/base/utils/colorsresources.dart';
import 'package:gpeers/base/utils/custom_appbar.dart';
import 'package:gpeers/base/utils/custom_button.dart';
import 'package:gpeers/base/utils/custom_container.dart';
import 'package:gpeers/base/utils/imagesresources.dart';

import 'login.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  OtpPage({Key key, this.phoneNumber}) : super(key: key);

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otp = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsResources.backgroundColorThree,
        appBar: CustomAppBar(
          title: 'Step 2/6',
          textColor: Colors.grey,
          onBackPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        body: Container(
          padding: EdgeInsets.only(top: 30, left: 25, right: 25),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                Images.register,
                height: 200,
              ),
              titleText('Verification', TextAlign.center, 18.0, Colors.black),
              SizedBox(height: 20),
              titleText(
                  'Enter six digit number that we sent to\n' +
                      widget.phoneNumber,
                  TextAlign.center,
                  14.0,
                  Colors.black54),
              Spacer(),
              CustomeContainerFied(
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: otp,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter the code';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontFamily: AppFont.primaryFont,
                      color: Colors.black,
                      letterSpacing: 4,
                      fontSize: 18,
                    ),
                    decoration: authTextInputDecoration('*  *  *  *  *  *'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButtonColumn(
                  btnTxt: 'Continue',
                  onTap: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => OtpPage()));
                    }
                  }),
              SizedBox(
                height: 4,
              )
            ],
          ),
        ));
  }
}
