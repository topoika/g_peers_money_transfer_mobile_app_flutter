import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/auth/login.dart';
import 'package:gpeers/base/screens/auth/otp.dart';
import 'package:gpeers/base/utils/Constant.dart';
import 'package:gpeers/base/utils/colorsresources.dart';
import 'package:gpeers/base/utils/custom_appbar.dart';
import 'package:gpeers/base/utils/custom_button.dart';
import 'package:gpeers/base/utils/custom_container.dart';
import 'package:gpeers/base/utils/custom_dialogbox.dart';
import 'package:gpeers/base/utils/imagesresources.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool phoneOkay = false;
  String countryCode = '+254';
  String myphoneNumber = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsResources.backgroundColorThree,
        appBar: CustomAppBar(
          title: 'Step 1/6',
          textColor: Colors.grey,
          onBackPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        body: Container(
          padding: EdgeInsets.only(top: 40, left: 25, right: 25),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                Images.register,
                height: 200,
              ),
              titleText('Registration', TextAlign.center, 18.0, Colors.black),
              SizedBox(height: 20),
              titleText(
                  'Enter your mobile number , we will send\n you OTP to varify later',
                  TextAlign.center,
                  14.0,
                  Colors.black54),
              Spacer(),
              CustomeContainerFied(
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Icon(
                        Icons.assignment,
                        size: 28,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 4),
                      titleText('(' + countryCode + ')', TextAlign.center, 18.0,
                          Colors.black54),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        width: 160,
                        child: TextFormField(
                          controller: phoneNumber,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          onChanged: (phoneNumber) {
                            if (phoneNumber.length == 10) {
                              setState(() {
                                phoneOkay = true;
                              });
                            } else {
                              setState(() {
                                phoneOkay = false;
                              });
                            }
                          },
                          // validator: (value) {
                          //   if (value.isEmpty) {
                          //     return '';
                          //   } else if (value.length < 10) {
                          //     return 'Phone Number must be atleast 10';
                          //   }
                          //   return null;
                          // },
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: AppFont.primaryFont,
                            color: Colors.black,
                            letterSpacing: 1,
                            fontSize: 18,
                          ),
                          decoration: authTextInputDecoration('123-4567-899'),
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.verified,
                        color: phoneOkay
                            ? ColorsResources.backgroundColorsOne
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              CustomButtonColumn(
                btnTxt: 'Continue',
                onTap: () {
                  if (phoneNumber.text.length < 1) {
                    _showMyDialog();
                  } else if (phoneNumber.text.length < 10) {
                    _showMyDialog2();
                  } else {
                    setState(() {
                      myphoneNumber = countryCode + ' - ' + phoneNumber.text;
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OtpPage(
                                  phoneNumber: myphoneNumber,
                                )));
                  }
                },
              ),
              SizedBox(
                height: 26,
              )
            ],
          ),
        ));
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertBox(
          title: 'Empty Field',
          text: 'Please enter your phone number',
          button1Txt: 'Try Again',
          //button2Txt: 'Forgot PIN',
          button1Tap: () {
            Navigator.pop(context);
          },
          button2Tap: null,
        );
      },
    );
  }

  Future<void> _showMyDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertBox(
          title: 'Invalid Phone Number',
          text: 'Please enter your full phone number to verify your identity',
          button1Txt: 'Continue',
          button1Tap: () {
            Navigator.pop(context);
          },
          button2Tap: null,
        );
      },
    );
  }
}
