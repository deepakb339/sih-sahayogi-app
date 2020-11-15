import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PlaceholderWidgetPassbookMember extends StatefulWidget {
  @override
  _PlaceholderWidgetPassbookMemberState createState() =>
      _PlaceholderWidgetPassbookMemberState();
}

class _PlaceholderWidgetPassbookMemberState
    extends State<PlaceholderWidgetPassbookMember> {
  String allFund, loanDue;
  @override
  void initState() {
    allFund = 'Rs 2334';
    loanDue = 'Rs 500';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Your Personal Savings Passbook:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('My personal Funds',
                                style: TextStyle(fontSize: 18)),
                            Text('My Loan Amount to pay',
                                style: TextStyle(fontSize: 18)),
                          ]),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(allFund,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(loanDue,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                  ],
                )),
                SizedBox(height: 400.0),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Contact Book keeper for approval of',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1. Taking internal loan from SHG',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '2. Contributing money to SHG',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
