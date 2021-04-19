import 'package:flutter/material.dart';
import 'package:gpeers/base/screens/auth/register.dart';
import 'package:gpeers/base/screens/home/homepage.dart';
import 'package:gpeers/base/utils/colorsresources.dart';
import 'package:gpeers/base/utils/custom_button.dart';
import 'package:gpeers/base/utils/custom_container.dart';
import 'package:gpeers/base/utils/custom_dialogbox.dart';
import 'package:gpeers/base/utils/imagesresources.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _pinNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  logIn() {
    if (_pinNumber.text == '2332') {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      print('No');
      setState(() {
        _pinNumber.text = '';
      });
      _showMyDialog();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomAlertBox(
          title: 'Wrong PIN',
          text:
              'Seems you have enter a wrong PIN, you can try again or ask for your PIN if forgotten',
          button1Txt: 'Try Again',
          button2Txt: 'Forgot PIN',
          button1Tap: () {
            Navigator.pop(context);
          },
          button2Tap: null,
        );
      },
    );
  }

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
                    Image.asset(Images.register),
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
                    CustomeContainerFied(
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _pinNumber,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          cursorColor: Colors.black,
                          style: TextStyle(
                            fontFamily: AppFont.primaryFont,
                            color: Colors.black,
                            letterSpacing: 3,
                            fontSize: 18,
                          ),
                          decoration: authTextInputDecoration('Enter Your PIN'),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButtonColumn(
                      btnTxt: 'Submit',
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          logIn();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 3),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'I dont have account! ',
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.primaryFont,
                          ),
                    ),
                    Text(
                      'Create Acount',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3.copyWith(
                            color: Colors.purple[600],
                            fontSize: 15,
                            fontFamily: AppFont.primaryFont,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
