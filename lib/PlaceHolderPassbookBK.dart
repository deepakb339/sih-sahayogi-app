import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PlaceholderWidgetPassbookBK extends StatefulWidget {
  @override
  _PlaceholderWidgetPassbookBKState createState() =>
      _PlaceholderWidgetPassbookBKState();
}

class _PlaceholderWidgetPassbookBKState
    extends State<PlaceholderWidgetPassbookBK> {
  String allFund, loanDue, savings, meetingDate, mpay, tpay;
  @override
  void initState() {
    allFund = 'Rs 2334';
    loanDue = 'Rs 1000';
    savings = 'Rs 1334';
    mpay = '1200';
    tpay = '14400';
    super.initState();
  }

  //var format = DateFormat.yMd();
  var meetingDateP = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  var attendanceDateP = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);

  void callDatePicker() async {
    var order = await getDate();
    setState(() {
      try {
        meetingDateP = formatDate(order, [yyyy, '-', mm, '-', dd]);
        meetingDate = meetingDateP.toString();
      } catch (e) {
        print(e);
      }
    });
  }

  Future<DateTime> getDate() {
    // Imagine that this function is
    // more complex and slow.
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
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
                  'Contributions * Loans * Payments approval:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Choose Date:', style: TextStyle(fontSize: 18)),
                          MaterialButton(
                            minWidth: 150.0,
                            height: 50.0,
                            onPressed: callDatePicker,
                            color: Colors.white,
                            child: new Text(meetingDateP,
                                style: TextStyle(color: Colors.black)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                  style: BorderStyle.solid),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Type:', style: TextStyle(fontSize: 18)),
                          Container(
                            width: 150.0,
                            child: TextField(
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                // interest = text;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: 'Type',
                                  labelText: 'Type:',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Member:', style: TextStyle(fontSize: 18)),
                          Container(
                            width: 150.0,
                            child: TextField(
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                // interest = text;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  hintText: 'Menber',
                                  labelText: 'Member:',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Phone Number:', style: TextStyle(fontSize: 18)),
                          Container(
                            width: 150.0,
                            child: TextField(
                              obscureText: false,
                              keyboardType: TextInputType.text,
                              onChanged: (text) {
                                // interest = text;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 15.0, 20.0, 15.0),
                                  prefixIcon: Icon(Icons.attach_money),
                                  hintText: 'Phone Number',
                                  labelText: 'Phone Number:',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(32.0))),
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.green,
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        onPressed: () {},
                        child: Text(
                          'Approve',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Your Personal Savings Passbook:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('My Personal Funds:',
                              style: TextStyle(fontSize: 18)),
                          Text('Rs 2334',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      )),
                      SizedBox(height: 10),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('My Loan amount to pay:',
                              style: TextStyle(fontSize: 18)),
                          Text('Rs 500',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
