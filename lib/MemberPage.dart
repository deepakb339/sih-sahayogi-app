import 'package:flutter/material.dart';
import 'package:shg/PlaceHolderAttendanceMember.dart';
import 'package:shg/PlaceHolderPassbookMember.dart';

class MemberPage extends StatefulWidget {
  MemberPage({Key key}) : super(key: key);

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PlaceholderWidgetAttendanceMember(),
    PlaceholderWidgetPassbookMember()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'Member Resources',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'Group Name',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            title: Text('My Attendance'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('My Passbook'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
