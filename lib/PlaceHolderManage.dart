import 'package:flutter/material.dart';

class PlaceholderWidgetManage extends StatefulWidget {
  @override
  _PlaceholderWidgetManageState createState() =>
      _PlaceholderWidgetManageState();
}

class _PlaceholderWidgetManageState extends State<PlaceholderWidgetManage> {
  String leader, bookkeeper, count;
  bool checkBoxValue1,
      checkBoxValue2,
      checkBoxValue3,
      checkBoxValue4,
      checkBoxValue5;
  @override
  void initState() {
    leader = 'Leader name';
    bookkeeper = 'Book Keeper name';
    count = '6';
    checkBoxValue1 = false;
    checkBoxValue2 = false;
    checkBoxValue3 = false;
    checkBoxValue4 = false;
    checkBoxValue5 = false;
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
                  'Group Info:',
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
                            Text('Leader Name:',
                                style: TextStyle(fontSize: 18)),
                            Text('Book Keeper:',
                                style: TextStyle(fontSize: 18)),
                            Text('Total Members:',
                                style: TextStyle(fontSize: 18)),
                          ]),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(leader,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(bookkeeper,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(count,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ]),
                    )
                  ],
                )),
                SizedBox(height: 20.0),
                Text(
                  'Manage Members:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Container(
                    child: Column(
                  children: <Widget>[
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {},
                            child: Text(
                              'Appoint Leader',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {},
                            child: Text(
                              'Make BookKeeper',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
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
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {},
                            child: Text(
                              'Remove',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Container(
                    child: Column(
                  children: <Widget>[
                    Container(
                        child: Row(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBoxValue1,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          checkBoxValue1 = newValue;
                                        });
                                      }),
                                  Text('Member 1')
                                ],
                              )),
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBoxValue2,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          checkBoxValue2 = newValue;
                                        });
                                      }),
                                  Text('Member 2')
                                ],
                              )),
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBoxValue3,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          checkBoxValue3 = newValue;
                                        });
                                      }),
                                  Text('Member 3')
                                ],
                              )),
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBoxValue4,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          checkBoxValue4 = newValue;
                                        });
                                      }),
                                  Text('Member 4')
                                ],
                              )),
                              Container(
                                  child: Row(
                                children: <Widget>[
                                  Checkbox(
                                      value: checkBoxValue5,
                                      activeColor: Colors.green,
                                      onChanged: (bool newValue) {
                                        setState(() {
                                          checkBoxValue5 = newValue;
                                        });
                                      }),
                                  Text('Member 5')
                                ],
                              )),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
