import 'package:flutter/material.dart';
import 'package:shg/PlaceHolderAttendance.dart';
import 'package:shg/PlaceHolderManage.dart';
import 'package:shg/PlaceHolderPassbook.dart';

class GroupLeaderPage extends StatefulWidget {
  GroupLeaderPage({Key key}) : super(key: key);

  @override
  _GroupLeaderPageState createState() => _GroupLeaderPageState();
}

class _GroupLeaderPageState extends State<GroupLeaderPage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    PlaceholderWidgetAttendance(),
    PlaceholderWidgetPassbook(),
    PlaceholderWidgetManage()
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
                    text: 'Group Leader Resources',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(text: '\n'),
                TextSpan(
                  text: 'Online',
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
            title: Text('Attendance Menu'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('View Passbook'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mode_edit),
            title: Text('Manage Members'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
