import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class PlaceholderWidgetAttendanceBookkeeper extends StatefulWidget {
  @override
  _PlaceholderWidgetAttendanceBookkeeperState createState() =>
      _PlaceholderWidgetAttendanceBookkeeperState();
}

class Month {
  int id;
  String name;

  Month(this.id, this.name);

  static List<Month> getMonths() {
    return <Month>[
      Month(0, 'Select Month:'),
      Month(1, 'January'),
      Month(2, 'Febuary'),
      Month(3, 'March'),
      Month(4, 'April'),
      Month(5, 'May'),
      Month(6, 'June'),
      Month(7, 'July'),
      Month(8, 'August'),
      Month(9, 'September'),
      Month(10, 'October'),
      Month(11, 'November'),
      Month(12, 'December'),
    ];
  }
}

class _PlaceholderWidgetAttendanceBookkeeperState
    extends State<PlaceholderWidgetAttendanceBookkeeper> {
  String monthAttendance, attended, absent, total;
  List<Month> _months = Month.getMonths();
  List<DropdownMenuItem<Month>> _dropdownMenuItems;
  Month _selectedMonth;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_months);
    _selectedMonth = _dropdownMenuItems[0].value;
    attended = '10';
    absent = '2';
    total = '12';
    super.initState();
  }

  List<DropdownMenuItem<Month>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Month>> items = List();
    for (Month month in companies) {
      items.add(
        DropdownMenuItem(
          value: month,
          child: Text(month.name),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Month selectedMonth) {
    setState(() {
      _selectedMonth = selectedMonth;
      monthAttendance = selectedMonth.name;
    });
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
                  'This is your attendance:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Choose Month:', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 20.0),
                      Container(
                        width: 150.0,
                        child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
                            child: DropdownButton(
                              value: _selectedMonth,
                              items: _dropdownMenuItems,
                              onChanged: onChangeDropdownItem,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0),
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
                          'Show Attendance',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
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
                            Text('Attended:', style: TextStyle(fontSize: 18)),
                            Text('Absent:', style: TextStyle(fontSize: 18)),
                            Text('Total:', style: TextStyle(fontSize: 18)),
                          ]),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(attended,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(absent,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Text(total,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ]),
                    ),
                    SizedBox(width: 20.0),
                    Container(
                        padding: EdgeInsets.all(30.0),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(
                              color: Colors.green[800],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          '83.33%',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))
                  ],
                )),
                SizedBox(
                  height: 80.0,
                ),
                Container(
                    child: Column(
                  children: <Widget>[
                    Text('For any attendance related queries',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('contact your group leader',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
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
