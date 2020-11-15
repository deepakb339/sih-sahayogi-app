import 'package:flutter/material.dart';
import 'package:shg/classes/language.dart';
import 'package:shg/localization/localization_constants.dart';
import 'package:shg/pages/RegisterPage.dart';
import 'package:shg/pages/SignInPage.dart';

import '../main.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  //String dropdownValue = "English";

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    MyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    final heading = Text(
      getTranslated(context, 'label1'),
      style: TextStyle(color: Colors.grey, fontSize: 22.0),
    );
    final welcome = Text(
      getTranslated(context, 'label2'),
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
    );
    final appname = Text(
      getTranslated(context, 'appname'),
      style: TextStyle(color: Colors.grey, fontSize: 25.0),
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
          getTranslated(context, 'btn_getStart'),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
    final notRegister = Material(
      color: Colors.white,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _sendToRegister,
        child: Text(
          'Not a registered User',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
    // final language = Container(
    //     child: Card(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(15.0)),
    //         child: DropdownButtonHideUnderline(
    //           child: ButtonTheme(
    //             alignedDropdown: true,
    //             child: DropdownButton(
    //               value: dropdownValue,
    //               icon: Icon(Icons.language),
    //               iconSize: 24,
    //               style: TextStyle(color: Colors.black),
    //               onChanged: (Language language) {
    //             _changeLanguage(language);
    //           },
    //               items: Language.languageList()
    //               .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
    //                     value: lang,
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                       children: <Widget>[
    //                         Text(
    //                           lang.name,
    //                           style: TextStyle(fontSize: 30),
    //                         ),
    //                         Text(lang.flag)
    //                       ],
    //                     ),
    //                   ))
    //               .toList(),
    //             ),
    //           ),
    //         )));

    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'self_help_group')),
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
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                heading,
                SizedBox(height: 35.0),
                welcome,
                SizedBox(height: 35.0),
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 35.0),
                appname,
                SizedBox(height: 35.0),
                // language,
                SizedBox(
                  height: 35.0,
                ),
                startButon,
                SizedBox(
                  height: 15.0,
                ),
                notRegister
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendToNext() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignInPage('')),
    );
  }

  _sendToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );
  }
}
