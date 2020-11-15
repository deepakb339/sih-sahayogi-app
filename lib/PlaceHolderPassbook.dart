import 'package:flutter/material.dart';

class PlaceholderWidgetPassbook extends StatefulWidget {
  @override
  _PlaceholderWidgetPassbookState createState() =>
      _PlaceholderWidgetPassbookState();
}

class _PlaceholderWidgetPassbookState extends State<PlaceholderWidgetPassbook> {
  String allFund, loanDue, savings, myFunds, myLoanPay;
  @override
  void initState() {
    allFund = 'Rs 2334';
    loanDue = 'Rs 1000';
    savings = 'Rs 1334';
    myFunds = 'Rs 2334';
    myLoanPay = 'Rs 500';
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
                  'Group Finances:',
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
                            Text('Overall Fund',
                                style: TextStyle(fontSize: 18)),
                            Text('Loan Amount Due',
                                style: TextStyle(fontSize: 18)),
                            Text('Savings', style: TextStyle(fontSize: 18)),
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
                            Text(savings,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ]),
                    )
                  ],
                )),
                SizedBox(height: 20.0),
                Text(
                  'Your Personal Savings Passbook:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Container(
                    child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Overall Fund',
                                style: TextStyle(fontSize: 18)),
                            Text('Loan Amount Due',
                                style: TextStyle(fontSize: 18)),
                          ]),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(myFunds,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(myLoanPay,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ]),
                    )
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
