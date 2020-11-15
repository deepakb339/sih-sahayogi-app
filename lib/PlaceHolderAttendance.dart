import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PlaceholderWidgetAttendance extends StatefulWidget {
  @override
  _PlaceholderWidgetAttendanceState createState() =>
      _PlaceholderWidgetAttendanceState();
}

class _PlaceholderWidgetAttendanceState
    extends State<PlaceholderWidgetAttendance> {
  String gname, contributionAmt, interest, contPenalty, loanPenalty;
  String contributionDate, meetingDate, attendanceDate;
  bool checkBoxValue1,
      checkBoxValue2,
      checkBoxValue3,
      checkBoxValue4,
      checkBoxValue5;
  var members = ['Member 1', 'Member 2', 'Member 3'];
  @override
  void initState() {
    checkBoxValue1 = false;
    checkBoxValue2 = false;
    checkBoxValue3 = false;
    checkBoxValue4 = false;
    checkBoxValue5 = false;
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

  void callDatePicker2() async {
    var order = await getDate();
    setState(() {
      try {
        attendanceDateP = formatDate(order, [yyyy, '-', mm, '-', dd]);
        attendanceDate = attendanceDateP.toString();
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
                  'Mark Attendance for Physical Meetings',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  onChanged: (text) {
                    gname = text;
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: 'Enter Meeting Title',
                      prefixIcon: Icon(Icons.group),
                      labelText: 'Meeting Title:',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    child: Row(children: <Widget>[
                  Text('Choose Date:'),
                  SizedBox(width: 90.0),
                  MaterialButton(
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
                ])),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Members List',
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
                    SizedBox(width: 30.0),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.green,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width / 3,
                            padding:
                                EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: () {},
                            child: Text(
                              'Mark Attendess',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(width: 30.0),
                Container(
                    child: Text('View Attendance',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(width: 20.0),
                Container(
                    child: Row(children: <Widget>[
                  Text('Choose Date:'),
                  SizedBox(width: 20.0),
                  MaterialButton(
                    onPressed: callDatePicker2,
                    color: Colors.white,
                    child: new Text(attendanceDateP,
                        style: TextStyle(color: Colors.black)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.green,
                        child: MaterialButton(
                          minWidth: MediaQuery.of(context).size.width / 5,
                          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          onPressed: () {},
                          child: Text(
                            'Show',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ])),
                SizedBox(height: 20.0),
                Text('Attendees are listed below:'),
                SizedBox(height: 20.0),
                Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: members.length,
                    itemBuilder: (context, position) {
                      return ListTile(
                        title: Text(members[position]),
                      );
                    },
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
