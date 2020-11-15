import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shg/classes/language.dart';
import 'package:shg/localization/localization_constants.dart';
import 'package:shg/pages/SignInPage.dart';

import '../main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //String dropdownValue = "English";
  bool _nvalidate = false;
  bool _pvalidate = false;
  bool _cvalidate = false;
  String name, phone, city, eText, ePText;

  @override
  void initState() {
    name = '';
    phone = '';
    city = '';
    super.initState();
  }

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    final heading = Text(
      'Fill in your details and get registered with us.',
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
    );
    final nameField = TextField(
      obscureText: false,
      keyboardType: TextInputType.text,
      onChanged: (text) {
        setState(() {
          name = text;
        });
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Enter your Name',
          errorText: _nvalidate ? eText : null,
          prefixIcon: Icon(Icons.person),
          labelText: 'Name:',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final phoneField = TextField(
      obscureText: false,
      maxLength: 10,
      keyboardType: TextInputType.phone,
      onChanged: (text) {
        setState(() {
          phone = text;
        });
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Enter your Mobile no.',
          errorText: _pvalidate ? ePText : null,
          prefixIcon: Icon(Icons.phone_iphone),
          labelText: 'Mobile:',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final cityField = TextField(
      obscureText: false,
      keyboardType: TextInputType.text,
      onChanged: (text) {
        setState(() {
          city = text;
        });
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Enter Your City',
          errorText: _cvalidate ? eText : null,
          prefixIcon: Icon(Icons.location_city),
          labelText: 'City:',
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final startButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _sendToNext,
        child: Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    final alreadyRegistered = Material(
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _sendToLogin,
        child: Text(
          'Already Registered? Goto Login',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                  text: 'Self Help Group',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'User Registration',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ))
            ])),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DropdownButton(
              onChanged: (Language language) {
                _changeLanguage(language);
              },
              underline: SizedBox(),
              icon: Icon(
                Icons.language,
                color: Colors.white,
              ),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              lang.name,
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(lang.flag)
                          ],
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                heading,
                SizedBox(height: 35.0),
                nameField,
                SizedBox(height: 35.0),
                phoneField,
                SizedBox(height: 35.0),
                cityField,
                // language,
                SizedBox(
                  height: 35.0,
                ),
                startButon,
                SizedBox(
                  height: 15.0,
                ),
                alreadyRegistered
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNext() {
    if (name == '' || name == null) {
      setState(() {
        _nvalidate = true;
        eText = 'Value Can\'t be Empty';
      });
    } else {
      setState(() {
        _nvalidate = false;
      });
    }
    if (phone == '' || phone == null) {
      _pvalidate = true;
      ePText = 'Value Can\'t be Empty';
    } else if (phone.length < 10 || phone.length > 10) {
      _pvalidate = true;
      ePText = 'Phone number must be of 10 Digits';
    } else {
      setState(() {
        _pvalidate = false;
      });
    }
    if (city == '' || city == null) {
      _cvalidate = true;
      eText = 'Value Can\'t be Empty';
    } else {
      setState(() {
        _cvalidate = false;
      });
    }
    if (_nvalidate == false && _pvalidate == false && _cvalidate == false) {
      Fluttertoast.showToast(
          msg: "Successfuly Registered",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage(name)),
      );
    }
  }

  _sendToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage('')),
    );
  }
}
